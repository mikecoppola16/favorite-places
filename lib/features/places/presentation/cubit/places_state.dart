import 'package:equatable/equatable.dart';
import 'package:favorite_places/features/places/domain/entities/place_entity.dart';

abstract class PlaceState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PlaceStateEmpty extends PlaceState {}

class PlaceStateAddNew extends PlaceState {
  final List<PlaceEntity> places;

  PlaceStateAddNew({required this.places});
}
