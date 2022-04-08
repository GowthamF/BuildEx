part of 'vehicle_bloc.dart';

abstract class VehicleEvent extends Equatable {
  const VehicleEvent();

  @override
  List<Object> get props => [];
}

class GetVehicle extends VehicleEvent {
  const GetVehicle();
}

class CreateVehicle extends VehicleEvent {
  final VehicleModel vehicleModel;
  const CreateVehicle({required this.vehicleModel});

  @override
  List<Object> get props => [vehicleModel];
}
