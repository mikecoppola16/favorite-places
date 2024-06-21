import 'dart:io';

import 'package:favorite_places/features/places/data/data_sources/local/database.dart';
import 'package:favorite_places/features/places/domain/entities/location_entity.dart';
import 'package:favorite_places/features/places/domain/entities/place_entity.dart';

class DbToPlace{
  static PlaceEntity map(PlaceTableData placeTd, LocationTableData locationTd) {
    return PlaceEntity(
          id: placeTd.id,
          title: placeTd.title,
          image: File(placeTd.image),
          location: LocationEntity(
              id: locationTd.id,
              latitude: locationTd.latitude,
              longitude: locationTd.longitude,
              address: locationTd.address,
              googleStaticMapsUri: locationTd.googleStaticMapsUri),
        );
  }
}
