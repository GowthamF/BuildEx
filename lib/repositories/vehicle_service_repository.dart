import 'package:buildex/helpers/helpers.dart';
import 'package:buildex/models/models.dart';
import 'package:buildex/services/services.dart';

class VehicleServiceRepository {
  late VehicleServicesService _vehicleServicesService;
  final HttpHelper httpHelper;

  VehicleServiceRepository(this.httpHelper) {
    _vehicleServicesService = VehicleServicesService(httpHelper);
  }

  Future<void> createVehicleService(VehicleServiceModel vehicleServiceModel) {
    return _vehicleServicesService.createVehicleService(vehicleServiceModel);
  }
}
