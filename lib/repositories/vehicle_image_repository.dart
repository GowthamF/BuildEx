import 'package:buildex/helpers/helpers.dart';
import 'package:buildex/models/models.dart';
import 'package:buildex/services/services.dart';

class VehicleImageRepository {
  late VehicleImageService _vehicleImageService;
  final HttpHelper httpHelper;

  VehicleImageRepository(this.httpHelper) {
    _vehicleImageService = VehicleImageService(httpHelper);
  }

  Future<void> createVehicleImage(VehicleImageModel vehicleImageModel) {
    return _vehicleImageService.createVehicleImage(vehicleImageModel);
  }

  Future<void> getVehicleImage(String id) {
    return _vehicleImageService.getVehicleImage(id);
  }
}
