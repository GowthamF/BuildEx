// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) => VehicleModel(
      registrationNumber: json['registrationNumber'] as String,
      engineCapacity: json['engineCapacity'] as int,
      fuelType: json['fuelType'] as String,
      gearType: json['gearType'] as String,
      isActive: json['isActive'] as bool,
      make: json['make'] as String,
      mileage: json['mileage'] as int,
      model: json['model'] as String,
      options: json['options'] as String,
      yom: json['yom'] as int,
    );

Map<String, dynamic> _$VehicleModelToJson(VehicleModel instance) =>
    <String, dynamic>{
      'registrationNumber': instance.registrationNumber,
      'make': instance.make,
      'model': instance.model,
      'yom': instance.yom,
      'mileage': instance.mileage,
      'gearType': instance.gearType,
      'fuelType': instance.fuelType,
      'options': instance.options,
      'engineCapacity': instance.engineCapacity,
      'isActive': instance.isActive,
    };
