import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'vehicle_service_event.dart';
part 'vehicle_service_state.dart';

class VehicleServiceBloc
    extends Bloc<VehicleServiceEvent, VehicleServiceState> {
  VehicleServiceBloc() : super(const VehicleServiceInitial()) {
    on<CreateVehicleService>(_onCreateVehicleService);
  }

  FutureOr<void> _onCreateVehicleService(
      CreateVehicleService event, Emitter<VehicleServiceState> emit) {}
}
