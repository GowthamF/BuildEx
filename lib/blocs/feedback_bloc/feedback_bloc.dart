import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'feedback_event.dart';
part 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  FeedbackBloc() : super(FeedbackInitial()) {}
}
