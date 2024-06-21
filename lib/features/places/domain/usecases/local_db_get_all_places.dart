// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:drift/drift.dart';
import 'package:either_dart/either.dart';
import 'package:favorite_places/core/baseclasses/usecase_local_base.dart';
import 'package:favorite_places/core/db/local_db_failure.dart';
import 'package:favorite_places/features/places/domain/entities/place_entity.dart';
import 'package:favorite_places/features/places/domain/repository_contracts/places_repository.dart';

class LocalDbGetAllPlaceUseCase implements LocalBaseUseCase<void, List<PlaceEntity>>  {  
  final PlacesRepository _placesRepository;

  LocalDbGetAllPlaceUseCase(this._placesRepository);
  
  @override
  Future<Either<DBFailure, List<PlaceEntity>>> execute(Void) {
     
     return _placesRepository.getAllLocalPLaces();
  }
  
}
