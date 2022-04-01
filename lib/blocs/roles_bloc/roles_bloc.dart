import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'roles_event.dart';
part 'roles_state.dart';

class RolesBloc extends Bloc<RolesEvent, RolesState> {
  RolesBloc() : super(const RolesInitial()) {
    on<UpdateRoles>(_onUpdateRoles);
  }

  FutureOr<void> _onUpdateRoles(UpdateRoles event, Emitter<RolesState> emit) {}
}
