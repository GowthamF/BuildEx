import 'dart:convert';

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
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = Map<String, dynamic>.from(jsonDecode(response.body));
      if (jsonResponse.containsKey('statusCode')) {
        if (jsonResponse['statusCode'] != 200) {
          var message = jsonResponse.containsKey('message')
              ? jsonResponse['message']
              : 'Error while creating an account';
          throw ReportToUserException(message: message);
        }
      }
    }

    if (response.statusCode != 200) {
      throw ReportToUserException(message: 'Error while creating an account');
    }
  }

  Future<ServiceCenterModel?> getServiceCenterByOwner(String userId) async {
    var response = await httpHelper.get(
      Uri.parse('serviceCenter/load-by-owner/$userId'),
    );
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = Map<String, dynamic>.from(jsonDecode(response.body));
      if (jsonResponse.containsKey('statusCode')) {
        if (jsonResponse['statusCode'] != 200) {
          var message = jsonResponse.containsKey('message')
              ? jsonResponse['message']
              : 'Error while retrieving';
          throw ReportToUserException(message: message);
        }
      } else {
        var serviceCenter = ServiceCenterModel.fromJson(jsonResponse);
        return serviceCenter;
      }
    }

    if (response.statusCode != 200) {
      throw ReportToUserException(message: 'Error while creating an account');
    }

    return null;
  }

  Future<List<ServiceCenterModel>> getAvailableServiceCenters() async {
    List<ServiceCenterModel> serviceCenters = [];
    var response = await httpHelper.get(
      Uri.parse('serviceCenter/load-by-owner'),
    );
    print(response.body);
    if (response.statusCode == 200) {
      var jsonResponse = Map<String, dynamic>.from(jsonDecode(response.body));
      if (jsonResponse.containsKey('statusCode')) {
        if (jsonResponse['statusCode'] != 200) {
          var message = jsonResponse.containsKey('message')
              ? jsonResponse['message']
              : 'Error while creating an account';
          throw ReportToUserException(message: message);
        }
      } else {
        var list = List<Map<String, dynamic>>.from(jsonDecode(response.body));
        serviceCenters = list
            .map<ServiceCenterModel>((e) => ServiceCenterModel.fromJson(e))
            .toList();
      }
    }

    if (response.statusCode != 200) {
      throw ReportToUserException(message: 'Error while creating an account');
    }

    return serviceCenters;
  }
}
