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

class TimetableLoaded extends TimetableState {}

class TimetableError extends TimetableState {
  final String message;
  const TimetableError({required this.message});

  @override
  List<Object> get props => [message];
}

class TimetableCreating extends TimetableState {}

class TimetableCreated extends TimetableState {
  final String? timetableId;
  const TimetableCreated(this.timetableId);
}

class TimetableUpdating extends TimetableState {}

class TimetableUpdated extends TimetableState {}
