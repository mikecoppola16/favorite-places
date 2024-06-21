import 'package:drift/drift.dart';
import 'package:either_dart/either.dart';
import 'package:favorite_places/core/db/local_db_failure.dart';
import 'package:favorite_places/features/places/data/models/local/db_place_model.dart';
import 'package:favorite_places/features/places/data/models/remote/location_results_model.dart';
import 'package:favorite_places/features/places/data/network/failure.dart';
import 'package:favorite_places/features/places/domain/entities/place_entity.dart';

abstract class PlacesRepository {
  Future<Either<Failure, LocationResultsModel>> getLocation(
      String latLng, String key);

  Future<Either<DBFailure, List<PlaceEntity>>> getAllLocalPLaces();

  Future<Either<DBFailure, PlaceEntity >> saveLocalPLace(PlaceModel placeModel);

  Future<Either<DBFailure, PlaceEntity>> deletelLocalPLace(PlaceModel placeModel);
}
