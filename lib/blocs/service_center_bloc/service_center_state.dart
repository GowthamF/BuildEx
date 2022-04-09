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
  final List<ServiceCenterModel> serviceCenters;
  const ServiceCenterLoaded({required this.serviceCenters});

  @override
  List<Object> get props => [serviceCenters];
}

class ServiceCenterByOwnerLoading extends ServiceCenterState {}

class ServiceCenterByOwnerLoaded extends ServiceCenterState {
  final ServiceCenterModel? serviceCenterModel;

  const ServiceCenterByOwnerLoaded({required this.serviceCenterModel});

  @override
  List<Object> get props => [serviceCenterModel!];
}

class ServiceCenterError extends ServiceCenterState {
  final String? error;
  const ServiceCenterError(this.error);

  @override
  List<Object> get props => [error!];
}

class ServiceCenterCreating extends ServiceCenterState {}

class ServiceCenterCreated extends ServiceCenterState {}
