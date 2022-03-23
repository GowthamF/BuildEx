// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleImageModel _$VehicleImageModelFromJson(Map<String, dynamic> json) =>
    VehicleImageModel(
      originalname: json['originalname'] as String,
      generatedName: json['generatedName'] as String,
      isActive: json['isActive'] as bool,
      vehicle: json['vehicle'] as String,
    );

Map<String, dynamic> _$VehicleImageModelToJson(VehicleImageModel instance) =>
    <String, dynamic>{
      'originalname': instance.originalname,
      'generatedName': instance.generatedName,
      'isActive': instance.isActive,
      'vehicle': instance.vehicle,
    };
