import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_space/core/widgets/build_custom_app_bar.dart';
import 'package:widget_space/feature/home/Ui/widgets/custom_buttom_bar.dart';
import 'package:widget_space/feature/home/Ui/widgets/main_view_body.dart';
import 'package:widget_space/feature/home/logic/manager/main_cubit.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const String routeName = 'main_view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainCubit>(
      create: (context) => MainCubit(),
      child: Scaffold(
        appBar: buildAppBar(context, 'الرئيسية'),
        body: MainViewBody(),
        bottomNavigationBar: const BottomBarCustom(),
      ),
    );
  }
}
