// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentModel _$AppointmentModelFromJson(Map<String, dynamic> json) =>
    AppointmentModel(
      userId: json['user'] as String,
      vehicleId: json['vehicle'] as String,
      timeSlotId: json['timeslot'] as String,
      serviceCenterId: json['serviceCenter'] as String,
      appointmentStatusId: json['appointmentStatus '] as String,
      requestDate: json['requestDate'] as String,
    );

Map<String, dynamic> _$AppointmentModelToJson(AppointmentModel instance) =>
    <String, dynamic>{
      'user': instance.userId,
      'vehicle': instance.vehicleId,
      'timeslot': instance.timeSlotId,
      'serviceCenter': instance.serviceCenterId,
      'appointmentStatus ': instance.appointmentStatusId,
      'requestDate': instance.requestDate,
    };
