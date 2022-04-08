part of 'vehicle_bloc.dart';

abstract class VehicleState extends Equatable {
  const VehicleState();

  @override
  List<Object> get props => [];
}

class VehicleInitial extends VehicleState {
  const VehicleInitial();
}

class VehicleLoading extends VehicleState {
  const VehicleLoading();
}

class VehicleLoaded extends VehicleState {
  const VehicleLoaded();
}

class VehicleError extends VehicleState {
  final String message;
  const VehicleError({required this.message});

  @override
  List<Object> get props => [message];
}

class VehicleCreating extends VehicleState {}

class VehicleCreated extends VehicleState {}
