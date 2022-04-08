import 'dart:convert';

import 'package:buildex/exceptions/exceptions.dart';
import 'package:buildex/helpers/helpers.dart';
import 'package:buildex/models/models.dart';

class TimetableService {
  final HttpHelper httpHelper;

  TimetableService(this.httpHelper);

  Future<String?> createTimetable(TimetableModel timetableModel) async {
    var response = await httpHelper.post(
      Uri.parse('timetable/create'),
      body: timetableModel.toJson(),
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
      if (jsonResponse.containsKey('_id')) {
        return jsonResponse['_id'];
      }
    }

    if (response.statusCode != 200) {
      throw ReportToUserException(message: 'Error while creating an account');
    }

    return null;
  }

  Future<void> updateTimetable(String id, TimetableModel timetableModel) async {
    var response = await httpHelper.put(
      Uri.parse('timetable/$id'),
      body: timetableModel.toJson(),
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

  Future<void> getTimetable(String id) async {
    var response = await httpHelper.get(
      Uri.parse('timetable/$id'),
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
}
