part of 'vehicle_bloc.dart';

abstract class VehicleEvent extends Equatable {
  const VehicleEvent();

  @override
  List<Object> get props => [];
}

class GetVehicles extends VehicleEvent {}

class CreateVehicle extends VehicleEvent {
  final VehicleModel vehicleModel;
  const CreateVehicle({required this.vehicleModel});

  @override
  List<Object> get props => [vehicleModel];
}

class GetVehicleById extends VehicleEvent {
  final String vehicleId;
  const GetVehicleById(this.vehicleId);

  @override
  List<Object> get props => [vehicleId];
}
