part of 'timeslot_bloc.dart';

abstract class TimeslotState extends Equatable {
  const TimeslotState();

  @override
  List<Object> get props => [];
}

class TimeslotInitial extends TimeslotState {
  const TimeslotInitial();
}

class TimeslotLoading extends TimeslotState {
  const TimeslotLoading();
}

class TimeslotLoaded extends TimeslotState {
  const TimeslotLoaded();
}

class TimeslotError extends TimeslotState {
  final String message;
  const TimeslotError({required this.message});

  @override
  List<Object> get props => [message];
}

class TimeslotCreating extends TimeslotState {}

class TimeslotCreated extends TimeslotState {}

class TimeslotUpdating extends TimeslotState {}

class TimeslotUpdated extends TimeslotState {}
