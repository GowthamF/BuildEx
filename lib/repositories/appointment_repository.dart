import 'package:buildex/helpers/helpers.dart';
import 'package:buildex/services/services.dart';

class AppointmentRepository {
  late AppointmentService _appointmentService;
  final HttpHelper httpHelper;

  AppointmentRepository(this.httpHelper) {
    _appointmentService = AppointmentService(httpHelper);
  }
}
