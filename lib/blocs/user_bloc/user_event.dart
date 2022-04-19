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

class LoginUser extends UserEvent {
  final String userName;
  final String password;

  const LoginUser({required this.userName, required this.password});

  @override
  List<Object> get props => [userName, password];
}

class GetProfile extends UserEvent {
  final String accessToken;

  const GetProfile({required this.accessToken});

  @override
  List<Object> get props => [accessToken];
}
