part of 'timetable_bloc.dart';

abstract class TimetableEvent extends Equatable {
  const TimetableEvent();

  @override
  List<Object> get props => [];
}

class GetTimetable extends TimetableEvent {
  final String id;
  const GetTimetable({required this.id});

  @override
  List<Object> get props => [id];
}

class CreateTimetable extends TimetableEvent {
  final TimetableModel timeTableModel;

  const CreateTimetable(this.timeTableModel);

  @override
  List<Object> get props => [timeTableModel];
}

class UpdateTimetable extends TimetableEvent {
  final TimetableModel timeTableModel;
  final String id;

  const UpdateTimetable({required this.id, required this.timeTableModel});

  @override
  List<Object> get props => [id, timeTableModel];
}
