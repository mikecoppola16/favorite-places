// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  int id;
  final double latitude;
  final double longitude;
  final String address;
  final String googleStaticMapsUri;

  LocationModel(
     { this.id = 0,
      required this.latitude,
      required this.longitude,
      required this.address,
      required this.googleStaticMapsUri});

  @override
  List<Object?> get props => [];
}
