part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUser extends UserEvent {
  const GetUser();
}

class RegisterUser extends UserEvent {
  final UserModel userModel;

  const RegisterUser({required this.userModel});

  @override
  List<Object> get props => [userModel];
}
