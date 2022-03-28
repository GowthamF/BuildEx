import 'package:json_annotation/json_annotation.dart';

part 'vehicle_service_model.g.dart';

@JsonSerializable()
class VehicleServiceModel {
  final String description;
  final DateTime date;
  final bool isActive;

  VehicleServiceModel({
    required this.description,
    required this.date,
    required this.isActive,
  });

  factory VehicleServiceModel.fromJson(Map<String, dynamic> json) {
    return _$VehicleServiceModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VehicleServiceModelToJson(this);
  }
}
