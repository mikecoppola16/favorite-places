import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object?> get props => [];
}

class GetLocation extends LocationEvent {
  const GetLocation();
}

class GetLocationHaveLatLng extends LocationEvent {
  const GetLocationHaveLatLng({required this.latlng});

  final LatLng latlng;
}
