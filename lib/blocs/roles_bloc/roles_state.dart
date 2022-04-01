part of 'roles_bloc.dart';

abstract class RolesState extends Equatable {
  const RolesState();

  @override
  List<Object> get props => [];
}

class RolesInitial extends RolesState {
  const RolesInitial();
}

class RolesLoading extends RolesState {
  const RolesLoading();
}

class RolesLoaded extends RolesState {
  const RolesLoaded();
}

class RolesError extends RolesState {
  const RolesError();
}

class RolesUpdating extends RolesState {
  const RolesUpdating();
}

class RolesUpdated extends RolesState {
  const RolesUpdated();
}
