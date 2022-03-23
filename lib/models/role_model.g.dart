// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoleModel _$RoleModelFromJson(Map<String, dynamic> json) => RoleModel(
      name: json['name'] as String,
      code: json['code'] as String,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$RoleModelToJson(RoleModel instance) => <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'isActive': instance.isActive,
    };
