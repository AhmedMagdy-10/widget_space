import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:widget_space/core/utils/app_colors.dart';

Future<void> selectedWidgetBottomSheet({required BuildContext context}) {
  return showBarModalBottomSheet(
    context: context,
    barrierColor: Colors.black45,
    enableDrag: true,
    expand: false,
    duration: const Duration(milliseconds: 500),
    backgroundColor: AppColors.primaryColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    animationCurve: Curves.easeInOutQuart,
    elevation: 0,
    bounce: true,
    builder: (context) {
      return Container();
    },
  );
}
