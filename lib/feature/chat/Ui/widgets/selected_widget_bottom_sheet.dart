import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:widget_space/core/helper/widgets_type.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/feature/chat/Ui/widgets/selected_Widget_details.dart';

Future<void> selectedWidgetBottomSheet({
  required BuildContext context,
  required WidgetType selectedType,
  required void Function(Map<String, dynamic>) onSend,
}) {
  return showBarModalBottomSheet(
    context: context,
    isDismissible: false,
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
      return SelectedWidgetDetails(type: selectedType, onSend: onSend);
    },
  );
}
