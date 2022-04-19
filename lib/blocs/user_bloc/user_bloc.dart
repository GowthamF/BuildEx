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
    on<LoginUser>(_onLoginUserEvent);
    on<GetProfile>(_onGetProfileEvent);
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

  FutureOr<void> _onLoginUserEvent(
      LoginUser event, Emitter<UserState> emit) async {
    try {
      emit(UserLogging());
      var accessToken =
          await userRepository.loginUser(event.userName, event.password);
      if (accessToken != null) {
        emit(UserLogged(accessToken: accessToken));
      } else {
        emit(const UserError(errorMessage: 'Error while logging'));
      }
    } on ReportToUserException catch (e) {
      emit(UserError(errorMessage: e.message));
    }
  }

  FutureOr<void> _onGetProfileEvent(
      GetProfile event, Emitter<UserState> emit) async {
    try {
      emit(UserProfileLoading());

      var userModel = await userRepository.getUser(event.accessToken);
      if (userModel != null) {
        emit(UserProfileLoaded(userModel: userModel));
      } else {
        emit(const UserError(errorMessage: 'Error while getting profile'));
      }
    } on ReportToUserException catch (e) {
      emit(UserError(errorMessage: e.message));
    }
  }
}
