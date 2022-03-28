part of 'timetable_bloc.dart';

abstract class TimetableEvent extends Equatable {
 const TimetableEvent();

 @override
 List<Object> get props => [];
}
class GetTimetable extends TimetableEvent {
 const GetTimetable();
}