import 'dart:async';

import 'package:buildex/exceptions/exceptions.dart';
import 'package:buildex/models/models.dart';
import 'package:buildex/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'vehicle_event.dart';
part 'vehicle_state.dart';

class VehicleBloc extends Bloc<VehicleEvent, VehicleState> {
  final VehicleRepository vehicleRepository;
  VehicleBloc(this.vehicleRepository) : super(const VehicleInitial()) {
    on<CreateVehicle>(_onCreateVehicle);
  }

  FutureOr<void> _onCreateVehicle(
      CreateVehicle event, Emitter<VehicleState> emit) async {
    try {
      emit(VehicleCreating());
      await vehicleRepository.createVehicle(event.vehicleModel);
      emit(VehicleCreated());
    } on ReportToUserException catch (e) {
      emit(VehicleError(message: e.message));
    }
  }
}
