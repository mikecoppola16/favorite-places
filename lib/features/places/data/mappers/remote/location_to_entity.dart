import 'package:favorite_places/core/constants/constants.dart';
import 'package:favorite_places/features/places/data/models/remote/location_results_model.dart';
import 'package:favorite_places/features/places/domain/entities/location_entity.dart';

class LocationEntityMapper {
  static LocationEntity map(
      double lat, double lng, LocationResultsModel locationResults) {
    return LocationEntity(
      latitude: lat,
      longitude: lng,
      address: locationResults.results[0][GOOGLE_MAPS_FIELD_ADDRESS],
      googleStaticMapsUri: GOOGLE_STATIC_MAPS_URI
          .replaceAll("lat", lat.toString())
          .replaceAll("lng", lng.toString()),
      id: 0,
    );
  }
}
