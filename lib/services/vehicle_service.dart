import 'dart:convert';

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

  Future<List<VehicleModel>> getAllVehicles() async {
    List<VehicleModel> vehicles = [];
    var response = await httpHelper.get(
      Uri.parse('vehicle'),
    );
    print(response.body);
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      if (responseBody is Map) {
        var jsonResponse = Map<String, dynamic>.from(responseBody);
        if (jsonResponse.containsKey('statusCode')) {
          if (jsonResponse['statusCode'] != 200) {
            var message = jsonResponse.containsKey('message')
                ? jsonResponse['message']
                : 'Error while creating an account';
            throw ReportToUserException(message: message);
          }
        }
      } else {
        var list = List<Map<String, dynamic>>.from(jsonDecode(response.body));
        vehicles =
            list.map<VehicleModel>((e) => VehicleModel.fromJson(e)).toList();
      }
    }

    if (response.statusCode != 200) {
      throw ReportToUserException(message: 'Error while creating an account');
    }

    return vehicles;
  }

  Future<VehicleModel?> getVehicleById(String vehicleId) async {
    var response = await httpHelper.get(
      Uri.parse('vehicle/$vehicleId'),
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
        var vehicleModel = VehicleModel.fromJson(jsonResponse);
        return vehicleModel;
      }
    }

    if (response.statusCode != 200) {
      throw ReportToUserException(message: 'Error while creating an account');
    }

    return null;
  }
}
