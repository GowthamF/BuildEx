import 'package:buildex/exceptions/exceptions.dart';
import 'package:buildex/helpers/helpers.dart';
import 'package:buildex/models/models.dart';

class VehicleImageService {
  final HttpHelper httpHelper;

  VehicleImageService(this.httpHelper);

  Future<void> createVehicleImage(VehicleImageModel vehicleImageModel) async {
    var response = await httpHelper.post(
      Uri.parse('vehicleImage/create'),
      body: vehicleImageModel.toJson(),
    );

    if (response.statusCode != 200) {
      throw ReportToUserException(message: 'Error while creating an account');
    }
  }

  Future<void> getVehicleImage(String id) async {
    var response = await httpHelper.get(
      Uri.parse('vehicleImage/$id'),
    );

    if (response.statusCode != 200) {
      throw ReportToUserException(message: 'Error while creating an account');
    }
  }
}
