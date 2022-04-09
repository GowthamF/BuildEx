// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_center_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceCenterModel _$ServiceCenterModelFromJson(Map<String, dynamic> json) =>
    ServiceCenterModel(
      name: json['name'] as String,
      address: json['address'] as String,
      id: json['_id'] as String,
    );

Map<String, dynamic> _$ServiceCenterModelToJson(ServiceCenterModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      '_id': instance.id,
    };
