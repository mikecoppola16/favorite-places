import 'package:equatable/equatable.dart';
import 'package:favorite_places/features/places/data/network/failure.dart';
import 'package:favorite_places/features/places/domain/entities/location_entity.dart';

abstract class LocationState extends Equatable {

  const LocationState();

  @override
  List<Object?> get props => [];
}

class LocationNotInitiated extends LocationState {
  const LocationNotInitiated();
  
  @override
  List<Object?> get props => [];
}

class PermissionNotGranted extends LocationState {
  const PermissionNotGranted();
  
  @override
  List<Object?> get props => [];
}

class LocationServiceNotEnabled extends LocationState {
  const LocationServiceNotEnabled();
  
  @override
  List<Object?> get props => [];
}

class LocationLoading extends LocationState {
  const LocationLoading();
  
}

class GetLocationError extends LocationState {
  const GetLocationError({required  this.error});

  final Failure error;
  
  @override
  List<Object?> get props => [error];
}

class GetLocationSuccess extends LocationState {
  const GetLocationSuccess({ required this.locationEntity});
  
  final LocationEntity locationEntity;

  @override
  List<Object?> get props => [locationEntity];
}
