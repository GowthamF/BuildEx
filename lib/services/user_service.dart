import 'dart:convert';

import 'package:buildex/exceptions/exceptions.dart';
import 'package:buildex/helpers/helpers.dart';
import 'package:buildex/models/models.dart';

class UserService {
  final HttpHelper httpHelper;

  UserService(this.httpHelper);

  Future<void> registerUser(UserModel userModel) async {
    var response = await httpHelper.post(
      Uri.parse('auth/register'),
      body: userModel.toJson(),
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

  Future<String?> loginUser(String userName, String password) async {
    var response = await httpHelper.post(
      Uri.parse('auth/login'),
      body: {'username': userName, 'password': password},
    );
    if (response.statusCode == 200) {
      var jsonResponse = Map<String, dynamic>.from(jsonDecode(response.body));
      if (jsonResponse.containsKey('statusCode')) {
        if (jsonResponse['statusCode'] != 200) {
          var message = jsonResponse.containsKey('message')
              ? jsonResponse['message']
              : 'Error while creating an account';
          throw ReportToUserException(message: message);
        } else {
          return jsonResponse['data']['accessToken'];
        }
      }
    }

    if (response.statusCode != 200) {
      throw ReportToUserException(message: 'Error while creating an account');
    }

    return null;
  }

  Future<void> logoutUser(UserModel userModel) async {
    var response = await httpHelper.post(
      Uri.parse('/auth/logout'),
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

  Future<UserModel?> getUser(String accessToken) async {
    customHeaders['Authorization'] = 'Bearer $accessToken';
    var response = await httpHelper.get(
      Uri.parse('auth/profile'),
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
        } else {
          return UserModel.fromJson(jsonResponse['data']);
        }
      }
    }

    if (response.statusCode != 200) {
      throw ReportToUserException(message: 'Error while creating an account');
    }

    return null;
  }
}
