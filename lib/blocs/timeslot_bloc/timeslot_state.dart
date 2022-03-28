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
 const TimeslotError();
}