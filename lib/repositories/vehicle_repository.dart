import 'package:buildex/helpers/helpers.dart';
import 'package:buildex/models/models.dart';
import 'package:buildex/services/services.dart';

class VehicleRepository {
  late VehicleService _vehicleService;
  final HttpHelper httpHelper;

  VehicleRepository(this.httpHelper) {
    _vehicleService = VehicleService(httpHelper);
  }

  Future<void> createVehicle(VehicleModel vehicleModel) {
    return _vehicleService.createVehicle(vehicleModel);
  }
}
