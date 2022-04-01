import 'dart:async';

import 'package:buildex/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'feedback_event.dart';
part 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  FeedbackBloc() : super(const FeedbackInitial()) {
    on<CreateFeedback>(_onCreateFeedback);
  }

  FutureOr<void> _onCreateFeedback(
      CreateFeedback event, Emitter<FeedbackState> emit) {}
}
