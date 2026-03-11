import 'package:flutter/material.dart';
import 'package:widget_space/core/widgets/build_custom_app_bar.dart';
import 'package:widget_space/feature/home/Ui/widgets/main_view_body.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const String routeName = 'main_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 'الرئيسية'),
      body: MainViewBody(),
    );
  }
}
