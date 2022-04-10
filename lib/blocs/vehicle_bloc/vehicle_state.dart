part of 'vehicle_bloc.dart';

abstract class VehicleState extends Equatable {
  const VehicleState();

  @override
  List<Object> get props => [];
}

class VehicleInitial extends VehicleState {
  const VehicleInitial();
}

class VehicleLoading extends VehicleState {}

class VehicleLoaded extends VehicleState {
  final List<VehicleModel> vehicles;
  const VehicleLoaded({required this.vehicles});

  @override
  List<Object> get props => [vehicles];
}

class VehicleError extends VehicleState {
  final String message;
  const VehicleError({required this.message});

  @override
  List<Object> get props => [message];
}

class VehicleCreating extends VehicleState {}

class VehicleCreated extends VehicleState {}

class VehicleByIdLoading extends VehicleState {}

class VehicleByIdLoaded extends VehicleState {
  final VehicleModel? vehicleModel;
  const VehicleByIdLoaded({required this.vehicleModel});
}
