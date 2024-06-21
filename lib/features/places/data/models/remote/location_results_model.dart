import 'package:json_annotation/json_annotation.dart';

part 'location_results_model.g.dart';

@JsonSerializable()
class LocationResultsModel {
  List<dynamic> results;

  LocationResultsModel({required this.results});

  factory LocationResultsModel.fromJson(Map<String, dynamic> data) =>
      _$LocationResultsModelFromJson(data);

  Map<String, dynamic> toJson() => _$LocationResultsModelToJson(this);
}
