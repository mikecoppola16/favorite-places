import 'package:either_dart/either.dart';
import 'package:favorite_places/core/baseclasses/usecase_base.dart';
import 'package:favorite_places/features/places/data/models/remote/location_request_model.dart';
import 'package:favorite_places/features/places/data/models/remote/location_results_model.dart';
import 'package:favorite_places/features/places/data/network/failure.dart';
import 'package:favorite_places/features/places/domain/repository_contracts/places_repository.dart';

class GetLocationUseCase implements BaseUseCase<LocationRequestModel, LocationResultsModel> {
  final PlacesRepository _locationRepository;

  GetLocationUseCase(this._locationRepository);
  
  @override
  Future<Either<Failure,LocationResultsModel>> execute(LocationRequestModel locationModel) {
     return _locationRepository.getLocation(locationModel.latLng,locationModel.apiKey);
  }
  
}
