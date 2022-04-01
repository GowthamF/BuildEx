import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'vehicle_event.dart';
part 'vehicle_state.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  VehicleBloc() : super(const VehicleInitial()) {
    on<CreateVehicle>(_onCreateVehicle);
  }

  FutureOr<void> _onCreateVehicle(
      CreateVehicle event, Emitter<VehicleState> emit) {}
}
