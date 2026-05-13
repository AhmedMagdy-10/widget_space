import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_space/feature/chat/Ui/views/chat_screen_view.dart';
import 'package:widget_space/feature/home/Ui/views/home_view.dart';
import 'main_cubit_states.dart';

class MainCubit extends Cubit<MainCubitStates> {
  MainCubit() : super(MainCubitInitial());

  List<Widget> views = const [
    HomeView(), ChatScreenView(),
    Center(child: Text("ويدجتاتي")), // صفحة مؤقتة
    Center(child: Text("حسابي")), // صفحة مؤقتة
  ];

  int currentIndexPage = 0;
  void changePage(int index) {
    currentIndexPage = index;
    emit(MainCubitChangePageState());
  }
}
