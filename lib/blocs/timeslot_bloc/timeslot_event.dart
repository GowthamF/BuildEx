part of 'timeslot_bloc.dart';

abstract class TimeslotEvent extends Equatable {
  const TimeslotEvent();

  @override
  List<Object> get props => [];
}

class GetTimeslot extends TimeslotEvent {
  const GetTimeslot();
}

class CreateTimeSlot extends TimeslotEvent {}

class UpdateTimeSlot extends TimeslotEvent {}
