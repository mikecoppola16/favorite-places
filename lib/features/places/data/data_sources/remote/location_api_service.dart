import 'package:dio/dio.dart';
import 'package:favorite_places/core/constants/constants.dart';
import 'package:favorite_places/features/places/data/models/remote/location_results_model.dart';
import 'package:retrofit/retrofit.dart';


part 'location_api_service.g.dart';

@RestApi(baseUrl: locationAPIBaseUrl)
abstract class LocationApiService {
  factory LocationApiService(Dio dio, {String baseUrl}) =
      _LocationApiService;

  // /maps/api/geocode/json?latlng=40.714224,-73.961452&key=YOUR_API_KEY'
  @GET('/maps/api/geocode/json')
  Future<HttpResponse<LocationResultsModel >> getLocation(
       @Query("latlng") String latlng, @Query("key") String key
      
  );

}
