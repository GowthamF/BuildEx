part of 'service_center_bloc.dart';

abstract class ServiceCenterEvent extends Equatable {
  const ServiceCenterEvent();

  @override
  List<Object> get props => [];
}

class GetServiceCenter extends ServiceCenterEvent {
  const GetServiceCenter();
}

class CreateServiceCenter extends ServiceCenterEvent {
  final ServiceCenterModel serviceCenterModel;
  const CreateServiceCenter({required this.serviceCenterModel});

  @override
  List<Object> get props => [serviceCenterModel];
}
