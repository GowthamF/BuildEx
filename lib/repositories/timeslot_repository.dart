import 'package:buildex/helpers/helpers.dart';
import 'package:buildex/models/models.dart';
import 'package:buildex/services/services.dart';

class TimeslotRepository {
  late TimeslotService _timeslotService;
  final HttpHelper httpHelper;

  TimeslotRepository(this.httpHelper) {
    _timeslotService = TimeslotService(httpHelper);
  }

  Future<void> createTimetable(TimeslotModel timeslotModel) {
    return _timeslotService.createTimetable(timeslotModel);
  }

  Future<void> updateTimetable(String id, TimeslotModel timetableModel) {
    return _timeslotService.updateTimetable(id, timetableModel);
  }

  Future<void> getTimetable(String id) {
    return _timeslotService.getTimetable(id);
  }
}
