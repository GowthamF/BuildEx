import 'package:buildex/exceptions/exceptions.dart';
import 'package:buildex/helpers/helpers.dart';
import 'package:buildex/models/models.dart';

class TimeslotService {
  final HttpHelper httpHelper;

  TimeslotService(this.httpHelper);

  Future<void> createTimetable(TimeslotModel timeslotModel) async {
    var response = await httpHelper.post(
      Uri.parse('timeslot/create'),
      body: timeslotModel.toJson(),
    );

    if (response.statusCode != 200) {
      throw ReportToUserException(message: 'Error while creating an account');
    }
  }

  Future<void> updateTimetable(String id, TimeslotModel timetableModel) async {
    var response = await httpHelper.put(
      Uri.parse('timeslot/$id'),
      body: timetableModel.toJson(),
    );

    if (response.statusCode != 200) {
      throw ReportToUserException(message: 'Error while creating an account');
    }
  }

  Future<void> getTimetable(String id) async {
    var response = await httpHelper.get(
      Uri.parse('timeslot/$id'),
    );

    if (response.statusCode != 200) {
      throw ReportToUserException(message: 'Error while creating an account');
    }
  }
}
