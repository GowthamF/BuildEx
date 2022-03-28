part of 'feedback_bloc.dart';

abstract class FeedbackState extends Equatable {
 const FeedbackState();

 @override
 List<Object> get props => [];
}
class FeedbackInitial extends FeedbackState {
 const FeedbackInitial();
}

class FeedbackLoading extends FeedbackState {
 const FeedbackLoading();
}

class FeedbackLoaded extends FeedbackState {
 const FeedbackLoaded();
}

class FeedbackError extends FeedbackState {
 const FeedbackError();
}