import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'timetable_event.dart';
part 'timetable_state.dart';

class TimetableBloc extends Bloc<TimetableEvent, TimetableState> {
  TimetableBloc() : super(TimetableInitial()) {}
}
