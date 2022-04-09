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
    on<GetServiceCenterByOwner>(_onGetServiceCenterByOwner);
    on<GetServiceCenters>(_onGetServiceCenters);
    on<GetServiceCenterById>(_onGetServiceCenterById);
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

  FutureOr<void> _onGetServiceCenterByOwner(
      GetServiceCenterByOwner event, Emitter<ServiceCenterState> emit) async {
    try {
      emit(ServiceCenterByOwnerLoading());
      var serviceCenter =
          await serviceCenterRepository.getServiceCenterByOwner(event.userId);
      emit(ServiceCenterByOwnerLoaded(serviceCenterModel: serviceCenter));
    } on ReportToUserException catch (e) {
      emit(ServiceCenterError(e.message));
    }
  }

  FutureOr<void> _onGetServiceCenterById(
      GetServiceCenterById event, Emitter<ServiceCenterState> emit) async {
    try {
      emit(ServiceCenterByIdLoading());
      var serviceCenter = await serviceCenterRepository
          .getServiceCenterById(event.serviceCenterId);
      emit(ServiceCenterByIdLoaded(serviceCenterModel: serviceCenter));
    } on ReportToUserException catch (e) {
      emit(ServiceCenterError(e.message));
    }
  }

  FutureOr<void> _onGetServiceCenters(
      GetServiceCenters event, Emitter<ServiceCenterState> emit) async {
    try {
      emit(const ServiceCenterLoading());
      var serviceCenters =
          await serviceCenterRepository.getAvailableServiceCenters();
      emit(ServiceCenterLoaded(serviceCenters: serviceCenters));
    } on ReportToUserException catch (e) {
      emit(ServiceCenterError(e.message));
    }
  }
}
