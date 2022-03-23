import 'package:json_annotation/json_annotation.dart';

part 'timetable_model.g.dart';

@JsonSerializable()
class TimetableModel {
  final String month;
  final String day;
  final bool isActive;

  TimetableModel({
    required this.month,
    required this.day,
    required this.isActive,
  });
}
