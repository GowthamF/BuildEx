import 'package:buildex/exceptions/exceptions.dart';
import 'package:buildex/helpers/helpers.dart';
import 'package:buildex/models/models.dart';

class VehicleService {
  final HttpHelper httpHelper;

  VehicleService(this.httpHelper);

  Future<void> createVehicle(VehicleModel vehicleModel) async {
    var response = await httpHelper.post(
      Uri.parse('vehicle/create'),
      body: vehicleModel.toJson(),
    );

    if (response.statusCode != 200) {
      throw ReportToUserException(message: 'Error while creating an account');
    }
  }
}
