part of 'service_center_bloc.dart';

abstract class ServiceCenterEvent extends Equatable {
  const ServiceCenterEvent();

  @override
  List<Object> get props => [];
}

class GetServiceCenters extends ServiceCenterEvent {
  const GetServiceCenters();
}

class GetServiceCenterByOwner extends ServiceCenterEvent {
  final String userId;

  const GetServiceCenterByOwner({required this.userId});

  @override
  List<Object> get props => [userId];
}

class CreateServiceCenter extends ServiceCenterEvent {
  final ServiceCenterModel serviceCenterModel;
  const CreateServiceCenter({required this.serviceCenterModel});

  @override
  List<Object> get props => [serviceCenterModel];
}
