import 'package:flutter_bloc/flutter_bloc.dart';
import 'main_cubit_states.dart';

class MainCubit extends Cubit<MainCubitStates> {
  MainCubit() : super(MainCubitInitial());

  int currentIndexPage = 0;
  void changePage(int index) {
    currentIndexPage = index;
    emit(MainCubitChangePageState());
  }
}
