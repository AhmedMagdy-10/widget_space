import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:widget_space/core/helper/widgets_type.dart';
import 'package:widget_space/core/utils/app_colors.dart';

Future<void> selectedWidgetBottomSheet({
  required BuildContext context,
  required void Function(WidgetType) onSelected,
}) {
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
      return Container(
        color: Colors.white,
        height: 200,
        child: Center(
          child: Text(
            'تم اختيار WidgetType معين',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      );
    },
  );
}
