import 'package:buildex/exceptions/exceptions.dart';
import 'package:buildex/helpers/helpers.dart';
import 'package:buildex/models/models.dart';

class VehicleServicesService {
  final HttpHelper httpHelper;

  VehicleServicesService(this.httpHelper);

  Future<void> createVehicleService(
      VehicleServiceModel vehicleServiceModel) async {
    var response = await httpHelper.post(
      Uri.parse('vehicleService/create'),
      body: vehicleServiceModel.toJson(),
    );

    if (response.statusCode != 200) {
      throw ReportToUserException(message: 'Error while creating an account');
    }
  }
}
