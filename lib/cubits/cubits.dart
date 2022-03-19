import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageChangeCubit extends Cubit<int> {
  HomePageChangeCubit() : super(0);

  void changePage(int currentIndex) => emit(currentIndex);
}

class ServiceCenterSlotCubit extends Cubit<DateTime?> {
  ServiceCenterSlotCubit() : super(null);

  void dateSelected(DateTime dateTime) => emit(dateTime);
}

class UserRolesCubit extends Cubit<List<String>> {
  UserRolesCubit() : super([]);

  void changeRole(String role) {
    state.add(role);
    return emit(state);
  }
}
