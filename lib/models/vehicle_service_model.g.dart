// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleServiceModel _$VehicleServiceModelFromJson(Map<String, dynamic> json) =>
    VehicleServiceModel(
      description: json['description'] as String,
      date: DateTime.parse(json['date'] as String),
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$VehicleServiceModelToJson(
        VehicleServiceModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'date': instance.date.toIso8601String(),
      'isActive': instance.isActive,
    };
