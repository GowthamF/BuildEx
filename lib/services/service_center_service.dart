import 'package:buildex/exceptions/exceptions.dart';
import 'package:buildex/helpers/helpers.dart';
import 'package:buildex/models/models.dart';

class ServiceCenterService {
  final HttpHelper httpHelper;

  ServiceCenterService(this.httpHelper);

  Future<void> createServiceCenter(
      ServiceCenterModel serviceCenterModel) async {
    var response = await httpHelper.post(
      Uri.parse('serviceCenter/create'),
      body: serviceCenterModel.toJson(),
    );

    if (response.statusCode != 200) {
      throw ReportToUserException(message: 'Error while creating an account');
    }
  }
}
