import 'package:json_annotation/json_annotation.dart';

part 'appointment_model.g.dart';

@JsonSerializable()
class AppointmentModel {
  @JsonKey(name: 'user')
  final String userId;

  @JsonKey(name: 'vehicle')
  final String vehicleId;

  @JsonKey(name: 'timeslot')
  final String timeSlotId;

  @JsonKey(name: 'serviceCenter')
  final String serviceCenterId;

  @JsonKey(name: 'appointmentStatus ')
  final String appointmentStatusId;

  final String requestDate;

  AppointmentModel(
      {required this.userId,
      required this.vehicleId,
      required this.timeSlotId,
      required this.serviceCenterId,
      required this.appointmentStatusId,
      required this.requestDate});

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return _$AppointmentModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AppointmentModelToJson(this);
  }
}
