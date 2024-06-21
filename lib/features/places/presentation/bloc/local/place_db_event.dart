import 'package:equatable/equatable.dart';
import 'package:favorite_places/features/places/domain/entities/place_entity.dart';

abstract class LocalDbEvent extends Equatable {
  const LocalDbEvent();

  @override
  List<Object?> get props => [];
}

class GetPLacesFromLocalDb extends LocalDbEvent {
  const GetPLacesFromLocalDb();
}

class SavePlaceToLocalDb extends LocalDbEvent {
  final PlaceEntity newPlace;
  const SavePlaceToLocalDb({required this.newPlace});
}

class DeletePlaceFromLocalDb extends LocalDbEvent {
  final PlaceEntity place;
  const DeletePlaceFromLocalDb({required this.place});
}
