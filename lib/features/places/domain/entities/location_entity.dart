import 'package:equatable/equatable.dart';
class LocationEntity extends Equatable {
  final int id;
  final double latitude;
  final double longitude;
  final String address;
  final String googleStaticMapsUri;

  const LocationEntity({ required this.id,required this.latitude, required this.longitude,  required this.address, required this.googleStaticMapsUri });

  @override
  List<Object?> get props => [id,latitude,longitude,address,googleStaticMapsUri ];
}
