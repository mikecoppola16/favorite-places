import 'package:favorite_places/core/constants/constants.dart';
import 'package:favorite_places/features/places/data/mappers/remote/location_to_entity.dart';
import 'package:favorite_places/features/places/data/models/remote/location_request_model.dart';
import 'package:favorite_places/features/places/data/network/failure.dart';
import 'package:favorite_places/features/places/domain/usecases/get_location.dart';
import 'package:favorite_places/features/places/presentation/bloc/remote/location_event.dart';
import 'package:favorite_places/features/places/presentation/bloc/remote/location_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetLocationUseCase _getLocationUseCase;

  LocationBloc(this._getLocationUseCase)
      : super(const LocationNotInitiated()) {
    on<GetLocation>(
      (event, emit) async {
        emit(const LocationLoading());

        Location location = Location();

        bool serviceEnabled;
        PermissionStatus permissionGranted;
        LocationData locationData;

        serviceEnabled = await location.serviceEnabled();
        if (!serviceEnabled) {
          serviceEnabled = await location.requestService();
          if (!serviceEnabled) {
            emit(const LocationServiceNotEnabled());
            return;
          }
        }

        permissionGranted = await location.hasPermission();
        if (permissionGranted == PermissionStatus.denied) {
          permissionGranted = await location.requestPermission();
          if (permissionGranted != PermissionStatus.granted) {
            emit(const PermissionNotGranted());
            return;
          }
        }

        locationData = await location.getLocation();

        var lng = locationData.longitude;
        var lat = locationData.latitude;

        if (lng == null || lat == null) {
          emit(GetLocationError(error: Failure(0, "")));
          return;
        }

        final dataState = await _getLocationUseCase.execute(
            LocationRequestModel(
                latitude: lat, longitude: lng, apiKey: MAPS_API_KEY));  

        if (dataState.isLeft) {
          emit(GetLocationError(error: dataState.left));
        } else {
          emit(GetLocationSuccess(
              locationEntity: LocationEntityMapper.map(
                  lat, lng, dataState.right)));
        }
      },
    );
    on<GetLocationHaveLatLng>((event, emit) async {
      emit(const LocationLoading());

      var lat = event.latlng.latitude;
      var lng = event.latlng.longitude;

      final dataState = await _getLocationUseCase.execute(LocationRequestModel(
          latitude: lat, longitude: lng, apiKey: MAPS_API_KEY));

      if (dataState.isLeft) {
        emit(GetLocationError(error: dataState.left));
      } else {
        emit(GetLocationSuccess(
            locationEntity: LocationEntityMapper.map(
                lat, lng, dataState.right)));
      }
    });
  }
}
