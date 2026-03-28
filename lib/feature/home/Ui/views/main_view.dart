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
    return BlocBuilder<MainCubit, MainCubitStates>(
      builder: (context, state) {
        var cubit = context.read<MainCubit>();
        int currentIndex = cubit.currentIndexPage;
        bool isChatPage = currentIndex == 1;

        return PopScope(
          canPop: currentIndex == 0,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
            if (isChatPage) {
              cubit.changePage(0);
            }
          },
          child: Scaffold(
            body: IndexedStack(index: currentIndex, children: cubit.views),

            bottomNavigationBar: isChatPage ? null : const BottomBarCustom(),
          ),
        );
      },
    );
  }
}
