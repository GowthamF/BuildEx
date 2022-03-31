import 'package:buildex/helpers/helpers.dart';
import 'package:buildex/models/models.dart';
import 'package:buildex/services/services.dart';

class FeedbackRepository {
  late FeedbackService _feedbackService;
  final HttpHelper httpHelper;

  FeedbackRepository(this.httpHelper) {
    _feedbackService = FeedbackService(httpHelper);
  }

  Future<void> createFeedback(FeedbackModel feedbackModel) {
    return _feedbackService.createFeedback(feedbackModel);
  }
}
