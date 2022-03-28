import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'timeslot_event.dart';
part 'timeslot_state.dart';

class TimeslotBloc extends Bloc<TimeslotEvent, TimeslotState> {
  TimeslotBloc() : super(TimeslotInitial()) {}
}
