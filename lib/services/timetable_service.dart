import 'package:buildex/exceptions/exceptions.dart';
import 'package:buildex/helpers/helpers.dart';
import 'package:buildex/models/models.dart';

class TimetableService {
  final HttpHelper httpHelper;

  TimetableService(this.httpHelper);

  Future<void> createTimetable(TimetableModel timetableModel) async {
    var response = await httpHelper.post(
      Uri.parse('timetable/create'),
      body: timetableModel.toJson(),
    );

    if (response.statusCode != 200) {
      throw ReportToUserException(message: 'Error while creating an account');
    }
  }

  Future<void> updateTimetable(String id, TimetableModel timetableModel) async {
    var response = await httpHelper.put(
      Uri.parse('timetable/$id'),
      body: timetableModel.toJson(),
    );

    if (response.statusCode != 200) {
      throw ReportToUserException(message: 'Error while creating an account');
    }
  }

  Future<void> getTimetable(String id) async {
    var response = await httpHelper.get(
      Uri.parse('timetable/$id'),
    );

    if (response.statusCode != 200) {
      throw ReportToUserException(message: 'Error while creating an account');
    }
  }
}
