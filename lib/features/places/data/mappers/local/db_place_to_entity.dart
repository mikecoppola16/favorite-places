import 'dart:io';
import 'package:favorite_places/features/places/data/models/local/db_place_model.dart';
import 'package:favorite_places/features/places/domain/entities/location_entity.dart';
import 'package:favorite_places/features/places/domain/entities/place_entity.dart';

class DbPlaceModelToEnitty{
  static PlaceEntity map(PlaceModel place) {
    return PlaceEntity(
          id: place.id,
          title: place.title,
          image: File(place.image),
          location: LocationEntity(
              id: place.location.id,
              latitude: place.location.latitude,
              longitude: place.location.longitude,
              address: place.location.address,
              googleStaticMapsUri: place.location.googleStaticMapsUri),
        );
  }
}
