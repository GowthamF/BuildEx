import 'dart:async';

import 'package:buildex/exceptions/exceptions.dart';
import 'package:buildex/models/models.dart';
import 'package:buildex/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'timeslot_event.dart';
part 'timeslot_state.dart';

class TimeslotBloc extends Bloc<TimeslotEvent, TimeslotState> {
  final TimeslotRepository timeslotRepository;
  TimeslotBloc(this.timeslotRepository) : super(const TimeslotInitial()) {
    on<GetTimeslot>(_onGetTimeSlot);
    on<CreateTimeSlot>(_onCreateTimeSlot);
    on<UpdateTimeSlot>(_onUpdateTimeSlot);
  }

  FutureOr<void> _onGetTimeSlot(
      GetTimeslot event, Emitter<TimeslotState> emit) async {
    try {
      emit(const TimeslotLoading());
      await timeslotRepository.getTimetable(event.id);
      emit(const TimeslotLoaded());
    } on ReportToUserException catch (e) {
      emit(TimeslotError(message: e.message));
    }
  }

  FutureOr<void> _onCreateTimeSlot(
      CreateTimeSlot event, Emitter<TimeslotState> emit) async {
    try {
      emit(TimeslotCreating());
      await timeslotRepository.createTimetable(event.timeslotModel);
      emit(TimeslotCreated());
    } on ReportToUserException catch (e) {
      emit(TimeslotError(message: e.message));
    }
  }

  FutureOr<void> _onUpdateTimeSlot(
      UpdateTimeSlot event, Emitter<TimeslotState> emit) async {
    try {
      emit(TimeslotUpdating());
      await timeslotRepository.updateTimetable(event.id, event.timeslotModel);
      emit(TimeslotUpdated());
    } on ReportToUserException catch (e) {
      emit(TimeslotError(message: e.message));
    }
  }
}
