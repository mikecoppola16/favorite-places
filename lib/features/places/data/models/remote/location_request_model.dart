// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';

class LocationRequestModel extends Equatable {
  final double? latitude;
  final double? longitude;
  final String apiKey;

  LocationRequestModel(
      {required this.latitude, required this.longitude, required this.apiKey});

  String get latLng => "$latitude,$longitude";

  @override
  List<Object?> get props => [latitude, longitude, apiKey];
}
