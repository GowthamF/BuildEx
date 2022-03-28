part of 'vehicle_service_bloc.dart';

abstract class VehicleServiceState extends Equatable {
 const VehicleServiceState();

 @override
 List<Object> get props => [];
}
class VehicleServiceInitial extends VehicleServiceState {
 const VehicleServiceInitial();
}

class VehicleServiceLoading extends VehicleServiceState {
 const VehicleServiceLoading();
}

class VehicleServiceLoaded extends VehicleServiceState {
 const VehicleServiceLoaded();
}

class VehicleServiceError extends VehicleServiceState {
 const VehicleServiceError();
}