import 'package:equatable/equatable.dart';
import 'package:favorite_places/core/db/local_db_failure.dart';
import 'package:favorite_places/features/places/domain/entities/place_entity.dart';

abstract class LocalDbPlacesState extends Equatable {
  final List<PlaceEntity>? allplaces;

  const LocalDbPlacesState({this.allplaces});

  @override
  List<Object?> get props => [];
}

class LocalDBLoading extends LocalDbPlacesState {
  const LocalDBLoading();
}

class GetPlacesFromLocalDBEmpty extends LocalDbPlacesState {
  const GetPlacesFromLocalDBEmpty();
}

class GetAllPlacesFromLocalDBSuccess extends LocalDbPlacesState {
  final List<PlaceEntity> places;

  const GetAllPlacesFromLocalDBSuccess({required this.places}):super(allplaces: places );
}

class SavePlaceToLocalDBSuccess extends LocalDbPlacesState {
   final List<PlaceEntity> places;
  const SavePlaceToLocalDBSuccess({required this.places}) :super(allplaces: places);
}

class DeletePlaceFromLocalDBError extends LocalDbPlacesState {
   final List<PlaceEntity> places;
  const DeletePlaceFromLocalDBError({required this.places}) :super(allplaces: places);
}

class LocalDbError extends LocalDbPlacesState {
  final String error;
  final List<PlaceEntity> places;

  const LocalDbError({required this.error, required this.places }):super(allplaces: places);
}
