part of 'service_center_bloc.dart';

abstract class ServiceCenterState extends Equatable {
  const ServiceCenterState();

  @override
  List<Object> get props => [];
}

class ServiceCenterInitial extends ServiceCenterState {
  const ServiceCenterInitial();
}

class ServiceCenterLoading extends ServiceCenterState {
  const ServiceCenterLoading();
}

class ServiceCenterLoaded extends ServiceCenterState {
  const ServiceCenterLoaded();
}

class ServiceCenterError extends ServiceCenterState {
  const ServiceCenterError();
}

class ServiceCenterCreating extends ServiceCenterState {}

class ServiceCenterCreated extends ServiceCenterState {}
