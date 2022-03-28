import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'vehicle_image_event.dart';
part 'vehicle_image_state.dart';

class VehicleImageBloc extends Bloc<VehicleImageEvent, VehicleImageState> {
  VehicleImageBloc() : super(VehicleImageInitial()) {}
}
