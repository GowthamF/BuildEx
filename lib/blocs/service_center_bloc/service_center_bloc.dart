import 'dart:async';

import 'package:buildex/exceptions/exceptions.dart';
import 'package:buildex/models/models.dart';
import 'package:buildex/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'service_center_event.dart';
part 'service_center_state.dart';

class ServiceCenterBloc extends Bloc<ServiceCenterEvent, ServiceCenterState> {
  final ServiceCenterRepository serviceCenterRepository;
  ServiceCenterBloc(this.serviceCenterRepository)
      : super(const ServiceCenterInitial()) {
    on<CreateServiceCenter>(_onCreateServiceCenter);
  }

  FutureOr<void> _onCreateServiceCenter(
      CreateServiceCenter event, Emitter<ServiceCenterState> emit) async {
    try {
      emit(ServiceCenterCreating());
      await serviceCenterRepository
          .createServiceCenter(event.serviceCenterModel);
      emit(ServiceCenterCreated());
    } on ReportToUserException catch (e) {
      emit(ServiceCenterError(e.message));
    }
  }
}
