part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {
  const UserInitial();
}

class UserLoading extends UserState {
  const UserLoading();
}

class UserLoaded extends UserState {
  const UserLoaded();
}

class UserError extends UserState {
  final String errorMessage;
  const UserError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class UserRegistering extends UserState {}

class UserRegistered extends UserState {}

class UserLogging extends UserState {}

class UserLogged extends UserState {}
