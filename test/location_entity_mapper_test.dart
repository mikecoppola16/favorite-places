import 'package:favorite_places/core/constants/constants.dart';
import 'package:favorite_places/features/places/data/mappers/remote/location_to_entity.dart';
import 'package:favorite_places/features/places/data/models/remote/location_results_model.dart';
import 'package:test/test.dart';

void main() {
  test("Map Location Results to Location Entity", () {
    var lat = 50.56;
    var lng = 99.63;
    var addressToBeFound = "test adress found";
    var googleStaticMapsUri = 'https://maps.googleapis.com/maps/api/staticmap?center=50.56,99.63&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C50.56,99.63&key=$MAPS_API_KEY';

    Map<String, String> map = {
      "test": "other field",
      GOOGLE_MAPS_FIELD_ADDRESS: addressToBeFound,
    };

    List<dynamic> testResults = [];
    testResults.add(map);

    var locationResults = LocationResultsModel(results: testResults);

    var result = LocationEntityMapper.map(lat, lng, locationResults);

    expect(result.latitude, lat);
    expect(result.longitude, lng);
    expect(result.address, addressToBeFound);
    expect(result.googleStaticMapsUri, googleStaticMapsUri);
  });
}
