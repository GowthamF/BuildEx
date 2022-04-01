import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'vehicle_image_event.dart';
part 'vehicle_image_state.dart';

class VehicleImageBloc extends Bloc<VehicleImageEvent, VehicleImageState> {
  VehicleImageBloc() : super(const VehicleImageInitial()) {
    on<CreateVehicleImage>(_onCreateVehicleImage);
  }

  FutureOr<void> _onCreateVehicleImage(
      CreateVehicleImage event, Emitter<VehicleImageState> emit) {}
}
