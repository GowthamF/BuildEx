import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'service_center_event.dart';
part 'service_center_state.dart';

class ServiceCenterBloc extends Bloc<ServiceCenterEvent, ServiceCenterState> {
  ServiceCenterBloc() : super(ServiceCenterInitial()) {}
}
