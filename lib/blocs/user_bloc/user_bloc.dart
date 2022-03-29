import 'dart:async';

import 'package:buildex/exceptions/exceptions.dart';
import 'package:buildex/models/models.dart';
import 'package:buildex/repositories/repositories.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(const UserInitial()) {
    on<RegisterUser>(_onRegisterUserEvent);
  }

  Future<void> _onRegisterUserEvent(
      RegisterUser event, Emitter<UserState> emit) async {
    try {
      emit(UserRegistering());
      await userRepository.registerUser(event.userModel);
      emit(UserRegistered());
    } on ReportToUserException catch (e) {
      emit(UserError(errorMessage: e.message));
    }
  }
}
