part of 'vehicle_image_bloc.dart';

abstract class VehicleImageEvent extends Equatable {
  const VehicleImageEvent();

  @override
  List<Object> get props => [];
}

class GetVehicleImage extends VehicleImageEvent {
  const GetVehicleImage();
}

class CreateVehicleImage extends VehicleImageEvent {}
