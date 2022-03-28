import 'package:json_annotation/json_annotation.dart';

part 'timeslot_model.g.dart';

@JsonSerializable()
class TimeslotModel {
  final DateTime startTime;
  final DateTime endTime;
  final bool isActive;
  final String timeTable;

  TimeslotModel({
    required this.startTime,
    required this.endTime,
    required this.timeTable,
    required this.isActive,
  });

  factory TimeslotModel.fromJson(Map<String, dynamic> json) {
    return _$TimeslotModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TimeslotModelToJson(this);
  }
}
