part of 'timetable_bloc.dart';

abstract class TimetableState extends Equatable {
 const TimetableState();

 @override
 List<Object> get props => [];
}
class TimetableInitial extends TimetableState {
 const TimetableInitial();
}

class TimetableLoading extends TimetableState {
 const TimetableLoading();
}

class TimetableLoaded extends TimetableState {
 const TimetableLoaded();
}

class TimetableError extends TimetableState {
 const TimetableError();
}