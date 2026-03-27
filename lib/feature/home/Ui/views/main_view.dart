import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_space/feature/home/Ui/widgets/custom_buttom_bar.dart';
import 'package:widget_space/feature/home/logic/manager/main_cubit.dart';
import 'package:widget_space/feature/home/logic/manager/main_cubit_states.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const String routeName = 'main_view';
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainCubit>(
      create: (context) => MainCubit(),
      child: Scaffold(
        body: BlocBuilder<MainCubit, MainCubitStates>(
          builder: (context, state) {
            var cubit = BlocProvider.of<MainCubit>(context);
            return cubit.views[cubit.currentIndexPage];
          },
        ),
        bottomNavigationBar: const BottomBarCustom(),
        // floatingActionButton: AnimatedSkeuoFAB(
        //   onPressed: () {},
        //   icon: Icons.add_comment_rounded,
        // ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }
}
