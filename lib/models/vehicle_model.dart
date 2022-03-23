import 'package:json_annotation/json_annotation.dart';

part 'vehicle_model.g.dart';

@JsonSerializable()
class VehicleModel {
  final String registrationNumber;
  final String make;
  final String model;
  final int yom;
  final int mileage;
  final String gearType;
  final String fuelType;
  final String options;
  final int engineCapacity;
  final bool isActive;

  VehicleModel({
    required this.registrationNumber,
    required this.engineCapacity,
    required this.fuelType,
    required this.gearType,
    required this.isActive,
    required this.make,
    required this.mileage,
    required this.model,
    required this.options,
    required this.yom,
  });
}
