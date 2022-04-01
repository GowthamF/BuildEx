part of 'vehicle_service_bloc.dart';

abstract class VehicleServiceEvent extends Equatable {
  const VehicleServiceEvent();

  @override
  List<Object> get props => [];
}

class GetVehicleService extends VehicleServiceEvent {
  const GetVehicleService();
}

class CreateVehicleService extends VehicleServiceEvent {}
