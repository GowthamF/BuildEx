// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timetable_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimetableModel _$TimetableModelFromJson(Map<String, dynamic> json) =>
    TimetableModel(
      month: json['month'] as String,
      day: json['day'] as String,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$TimetableModelToJson(TimetableModel instance) =>
    <String, dynamic>{
      'month': instance.month,
      'day': instance.day,
      'isActive': instance.isActive,
    };
