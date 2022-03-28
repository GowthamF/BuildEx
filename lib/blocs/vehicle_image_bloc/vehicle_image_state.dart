part of 'vehicle_image_bloc.dart';

abstract class VehicleImageState extends Equatable {
 const VehicleImageState();

 @override
 List<Object> get props => [];
}
class VehicleImageInitial extends VehicleImageState {
 const VehicleImageInitial();
}

class VehicleImageLoading extends VehicleImageState {
 const VehicleImageLoading();
}

class VehicleImageLoaded extends VehicleImageState {
 const VehicleImageLoaded();
}

class VehicleImageError extends VehicleImageState {
 const VehicleImageError();
}