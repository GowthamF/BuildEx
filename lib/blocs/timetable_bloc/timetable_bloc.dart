import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'timetable_event.dart';
part 'timetable_state.dart';

class TimetableBloc extends Bloc<TimetableEvent, TimetableState> {
  TimetableBloc() : super(const TimetableInitial()) {
    on<GetTimetable>(_onGetTimetable);
    on<CreateTimetable>(_onCreateTimetable);
    on<UpdateTimetable>(_onUpdateTimetable);
  }

  FutureOr<void> _onGetTimetable(
      GetTimetable event, Emitter<TimetableState> emit) {}

  FutureOr<void> _onCreateTimetable(
      CreateTimetable event, Emitter<TimetableState> emit) {}

  FutureOr<void> _onUpdateTimetable(
      UpdateTimetable event, Emitter<TimetableState> emit) {}
}
