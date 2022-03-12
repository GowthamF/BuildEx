import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageChangeCubit extends Cubit<int> {
  HomePageChangeCubit() : super(0);

  void changePage(int currentIndex) => emit(currentIndex);
}
