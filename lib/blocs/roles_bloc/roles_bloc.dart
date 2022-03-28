import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'roles_event.dart';
part 'roles_state.dart';

class RolesBloc extends Bloc<RolesEvent, RolesState> {
  RolesBloc() : super(RolesInitial()) {}
}
