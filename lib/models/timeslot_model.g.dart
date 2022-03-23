// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeslot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeslotModel _$TimeslotModelFromJson(Map<String, dynamic> json) =>
    TimeslotModel(
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      timeTable: json['timeTable'] as String,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$TimeslotModelToJson(TimeslotModel instance) =>
    <String, dynamic>{
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'isActive': instance.isActive,
      'timeTable': instance.timeTable,
    };
