import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:favorite_places/features/places/domain/entities/location_entity.dart';

class PlaceEntity extends Equatable{
  final int id;
  final String title;
  final File image;
  final LocationEntity location;

  const PlaceEntity(
      {required this.id,
      required this.location,
      required this.title,
      required this.image});
      
        @override
        List<Object?> get props =>[id, title, image, location];
}
