// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:favorite_places/features/places/data/models/local/db_location_model.dart';

class PlaceModel extends Equatable {
  int id;
  final String title;
  final String image;
  final LocationModel location;

  PlaceModel(
      {this.id = 0, required this.location, required this.title, required this.image});

  @override
  List<Object?> get props => [id, title, image, location];
}
