import 'package:buildex/helpers/helpers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageChangeCubit extends Cubit<int> {
  HomePageChangeCubit() : super(0);

  void changePage(int currentIndex) => emit(currentIndex);
}

class ServiceCenterSlotCubit extends Cubit<DateTime?> {
  ServiceCenterSlotCubit() : super(null);

  void dateSelected(DateTime dateTime) => emit(dateTime);
}

class UserRolesCubit extends Cubit<List<UserRoles?>> {
  UserRolesCubit() : super([UserRoles.vehicleOwner]);

  void changeRole(UserRoles role) {
    state.add(role);
    return emit(state.toList());
  }

  void removeRole(UserRoles role) {
    if (state.length > 1) {
      state.remove(role);
      return emit(state.toList());
    }
  }
}
