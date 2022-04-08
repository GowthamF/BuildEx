import 'dart:async';

import 'package:buildex/exceptions/exceptions.dart';
import 'package:buildex/models/models.dart';
import 'package:buildex/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'timetable_event.dart';
part 'timetable_state.dart';

class TimetableBloc extends Bloc<TimetableEvent, TimetableState> {
  final TimetableRepository timetableRepository;
  TimetableBloc(this.timetableRepository) : super(const TimetableInitial()) {
    on<GetTimetable>(_onGetTimetable);
    on<CreateTimetable>(_onCreateTimetable);
    on<UpdateTimetable>(_onUpdateTimetable);
  }

  FutureOr<void> _onGetTimetable(
      GetTimetable event, Emitter<TimetableState> emit) async {
    try {
      emit(const TimetableLoading());
      await timetableRepository.getTimetable(event.id);
      emit(TimetableLoaded());
    } on ReportToUserException catch (e) {
      emit(TimetableError(message: e.message));
    }
  }

  FutureOr<void> _onCreateTimetable(
      CreateTimetable event, Emitter<TimetableState> emit) async {
    try {
      emit(TimetableCreating());
      var timeTableId =
          await timetableRepository.createTimetable(event.timeTableModel);
      emit(TimetableCreated(timeTableId));
    } on ReportToUserException catch (e) {
      emit(TimetableError(message: e.message));
    }
  }

  FutureOr<void> _onUpdateTimetable(
      UpdateTimetable event, Emitter<TimetableState> emit) async {
    try {
      emit(TimetableUpdating());
      await timetableRepository.updateTimetable(event.id, event.timeTableModel);
      emit(TimetableUpdated());
    } on ReportToUserException catch (e) {
      emit(TimetableError(message: e.message));
    }
  }
}
