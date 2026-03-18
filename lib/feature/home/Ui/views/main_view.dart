import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/core/widgets/custom_fab.dart';
import 'package:widget_space/core/widgets/custom_icons_shape.dart';
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          title: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: SvgPicture.asset('assets/images/apple_icon.svg'),
              ),
              const SizedBox(width: 10),
              Row(
                children: [
                  const Text(
                    'Ahmed Magdy',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const Text(
                    '  ✦',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.lightseconderyColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: CustomIconShape(icon: Icons.notifications_active),
            ),
          ],
        ),
        body: MainViewBody(),
        bottomNavigationBar: const BottomBarCustom(),
        floatingActionButton: AnimatedSkeuoFAB(
          onPressed: () {},
          icon: Icons.add_comment_rounded,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }
}
