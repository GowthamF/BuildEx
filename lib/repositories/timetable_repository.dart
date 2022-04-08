import 'package:buildex/helpers/helpers.dart';
import 'package:buildex/models/models.dart';
import 'package:buildex/services/services.dart';

class TimetableRepository {
  late TimetableService _timetableService;
  final HttpHelper httpHelper;

  TimetableRepository(this.httpHelper) {
    _timetableService = TimetableService(httpHelper);
  }

  Future<String?> createTimetable(TimetableModel timetableModel) {
    return _timetableService.createTimetable(timetableModel);
  }

  Future<void> updateTimetable(String id, TimetableModel timetableModel) {
    return _timetableService.updateTimetable(id, timetableModel);
  }

  Future<void> getTimetable(String id) {
    return _timetableService.getTimetable(id);
  }
}
