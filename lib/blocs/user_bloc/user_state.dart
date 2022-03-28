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
 const UserError();
}