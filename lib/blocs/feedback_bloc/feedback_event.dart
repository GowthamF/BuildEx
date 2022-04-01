part of 'feedback_bloc.dart';

abstract class FeedbackEvent extends Equatable {
  const FeedbackEvent();

  @override
  List<Object> get props => [];
}

class GetFeedback extends FeedbackEvent {
  const GetFeedback();
}

class CreateFeedback extends FeedbackEvent {
  final FeedbackModel feedbackModel;
  const CreateFeedback({required this.feedbackModel});

  @override
  List<Object> get props => [feedbackModel];
}
