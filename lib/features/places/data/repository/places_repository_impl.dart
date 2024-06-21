import 'dart:io';

import 'package:drift/drift.dart';
import 'package:either_dart/either.dart';
import 'package:favorite_places/assets/strings.dart';
import 'package:favorite_places/core/baseclasses/repository_base.dart';
import 'package:favorite_places/core/db/local_db_failure.dart';
import 'package:favorite_places/core/extension/http.dart';
import 'package:favorite_places/features/places/data/data_sources/local/database.dart';
import 'package:favorite_places/features/places/data/data_sources/remote/location_api_service.dart';
import 'package:favorite_places/features/places/data/mappers/local/db_place_to_entity.dart';
import 'package:favorite_places/features/places/data/mappers/local/db_to_place.dart';
import 'package:favorite_places/features/places/data/models/local/db_place_model.dart';
import 'package:favorite_places/features/places/data/models/remote/location_results_model.dart';
import 'package:favorite_places/features/places/data/network/error_handler.dart';
import 'package:favorite_places/features/places/data/network/failure.dart';
import 'package:favorite_places/features/places/domain/entities/place_entity.dart';
import 'package:favorite_places/features/places/domain/repository_contracts/places_repository.dart';

class PlacesRepositoryImpl extends BaseRepository implements PlacesRepository {
  final LocationApiService _locationApiService;
  final AppDatabase _appDataBase;

  PlacesRepositoryImpl(this._locationApiService, this._appDataBase);

  // ------- Remote Sources ---------
  @override
  Future<Either<Failure, LocationResultsModel>> getLocation(
      String latLng, String key) async {
    try {
      final httpResponse = await _locationApiService.getLocation(latLng, key);
      if (httpResponse.statusCode() == HttpStatus.ok) {
        return Right(httpResponse.data);
      } else {
        return Left(nullCheckFailure(
            httpResponse.statusCode(), httpResponse.statusMessage()));
      }
    } catch (e) {
      return (Left(ErrorHandler.handle(e).failure));
    }
  }

  // ------- Local DB ---------
  @override
  Future<Either<DBFailure, List<PlaceEntity>>> getAllLocalPLaces() async {
    var placeTable = _appDataBase.placeTable;
    var locationTable = _appDataBase.locationTable;

    try {
      final query = _appDataBase.select(placeTable).join([
        /// Join PlaceTable with locationTable with locationTable id
        innerJoin(
          locationTable,
          placeTable.location.equalsExp(locationTable.id),
        ),
      ]);

      query.orderBy([OrderingTerm.desc(placeTable.id)]);

      final queryResult = await query.get();
      final List<PlaceEntity> listPlaces = [];

      for (var row in queryResult) {
        listPlaces.add(DbToPlace.map(
            row.readTable(placeTable), row.readTable(locationTable)));
      }
      return Right(listPlaces);
    } catch (e) {
      return Left(DBFailure(error: AppString.dbFailGetAllPlaces));
    }
  }

  @override
  Future<Either<DBFailure, PlaceEntity>> saveLocalPLace(
      PlaceModel placeModel) async {
    var placeTable = _appDataBase.placeTable;
    var locationTable = _appDataBase.locationTable;
    var location = placeModel.location;

    try {
      // Insert new location to db
      int newLocationId = await _appDataBase.into(locationTable).insert(
            LocationTableCompanion.insert(
                latitude: location.latitude,
                longitude: location.longitude,
                address: location.address,
                googleStaticMapsUri: location.googleStaticMapsUri),
          );

      //use location id from above and add new palce
      int newPlaceId = await _appDataBase.into(placeTable).insert(
            PlaceTableCompanion.insert(
              title: placeModel.title,
              image: placeModel.image,
              location: newLocationId,
            ),
          );

      placeModel.id = newPlaceId;
      placeModel.location.id = newLocationId;
      return Right(DbPlaceModelToEnitty.map(placeModel));
    } catch (e) {
      return Left(DBFailure(error: AppString.dbFailSaveNewPlace));
    }
  }

  @override
  Future<Either<DBFailure, PlaceEntity>> deletelLocalPLace(
      PlaceModel placeModel) async {
    var placeTable = _appDataBase.placeTable;
    var locationTable = _appDataBase.locationTable;

    try {
      await (_appDataBase.delete(placeTable)
            ..where((tbl) => tbl.id.equals(placeModel.id)))
          .go();
      await (_appDataBase.delete(locationTable)
            ..where((tbl) => tbl.id.equals(placeModel.location.id)))
          .go();

      return Right(DbPlaceModelToEnitty.map(placeModel));
    } catch (e) {
      return Left(DBFailure(error: AppString.dbDeletePlaceFailed));
    }
  }
}
