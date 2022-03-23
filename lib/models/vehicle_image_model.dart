import 'package:json_annotation/json_annotation.dart';

part 'vehicle_image_model.g.dart';

@JsonSerializable()
class VehicleImageModel {
  final String originalname;
  final String generatedName;
  final bool isActive;
  final String vehicle;

  VehicleImageModel({
    required this.originalname,
    required this.generatedName,
    required this.isActive,
    required this.vehicle,
  });
}
