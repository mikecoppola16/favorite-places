import 'package:favorite_places/features/places/data/models/local/db_location_model.dart';
import 'package:favorite_places/features/places/data/models/local/db_place_model.dart';
import 'package:favorite_places/features/places/domain/entities/place_entity.dart'; 

class DbPlaceEntityToModel{
  static PlaceModel map(PlaceEntity placeEntity) {
    return PlaceModel(
          id: placeEntity.id,
          title: placeEntity.title,
          image: placeEntity.image.path,
          location: LocationModel(
              id: placeEntity.location.id,
              latitude: placeEntity.location.latitude,
              longitude: placeEntity.location.longitude,
              address: placeEntity.location.address,
              googleStaticMapsUri: placeEntity.location.googleStaticMapsUri),
        );
  }
}
