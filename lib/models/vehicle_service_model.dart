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
}
