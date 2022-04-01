import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'timeslot_event.dart';
part 'timeslot_state.dart';

class TimeslotBloc extends Bloc<TimeslotEvent, TimeslotState> {
  TimeslotBloc() : super(const TimeslotInitial()) {
    on<GetTimeslot>(_onGetTimeSlot);
    on<CreateTimeSlot>(_onCreateTimeSlot);
    on<UpdateTimeSlot>(_onUpdateTimeSlot);
  }

  FutureOr<void> _onGetTimeSlot(
      GetTimeslot event, Emitter<TimeslotState> emit) {}

  FutureOr<void> _onCreateTimeSlot(
      CreateTimeSlot event, Emitter<TimeslotState> emit) {}

  FutureOr<void> _onUpdateTimeSlot(
      UpdateTimeSlot event, Emitter<TimeslotState> emit) {}
}
