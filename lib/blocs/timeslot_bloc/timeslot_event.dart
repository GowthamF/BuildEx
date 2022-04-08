part of 'timeslot_bloc.dart';

abstract class TimeslotEvent extends Equatable {
  const TimeslotEvent();

  @override
  List<Object> get props => [];
}

class GetTimeslot extends TimeslotEvent {
  final String id;
  const GetTimeslot(this.id);

  @override
  List<Object> get props => [id];
}

class CreateTimeSlot extends TimeslotEvent {
  final TimeslotModel timeslotModel;
  const CreateTimeSlot(this.timeslotModel);

  @override
  List<Object> get props => [timeslotModel];
}

class UpdateTimeSlot extends TimeslotEvent {
  final String id;
  final TimeslotModel timeslotModel;

  const UpdateTimeSlot(this.id, this.timeslotModel);

  @override
  List<Object> get props => [id, timeslotModel];
}
