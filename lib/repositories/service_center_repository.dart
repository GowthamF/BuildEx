import 'package:buildex/helpers/helpers.dart';
import 'package:buildex/models/models.dart';
import 'package:buildex/services/services.dart';

class ServiceCenterRepository {
  late ServiceCenterService _serviceCenterService;
  final HttpHelper httpHelper;

  ServiceCenterRepository(this.httpHelper) {
    _serviceCenterService = ServiceCenterService(httpHelper);
  }

  Future<void> createServiceCenter(ServiceCenterModel serviceCenterModel) {
    return _serviceCenterService.createServiceCenter(serviceCenterModel);
  }
}
