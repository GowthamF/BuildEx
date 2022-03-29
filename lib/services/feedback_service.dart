import 'package:buildex/exceptions/exceptions.dart';
import 'package:buildex/helpers/helpers.dart';
import 'package:buildex/models/models.dart';

class FeedbackService {
  final HttpHelper httpHelper;

  FeedbackService(this.httpHelper);

  Future<void> createFeedback(FeedbackModel feedbackModel) async {
    var response = await httpHelper.post(
      Uri.parse('feedback/create'),
      body: feedbackModel.toJson(),
    );

    if (response.statusCode != 200) {
      throw ReportToUserException(message: 'Error while creating an account');
    }
  }
}
