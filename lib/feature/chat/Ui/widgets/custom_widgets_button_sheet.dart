import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:widget_space/core/helper/widgets_type.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/core/utils/app_text_styles.dart';
import 'package:widget_space/feature/chat/Ui/widgets/selected_widget.dart';
import 'package:widget_space/feature/chat/Ui/widgets/widget_type_picker_item.dart';

Future<void> showWidgetPicker({
  required BuildContext context,
  required void Function(WidgetType, Map<String, dynamic>) onSend,
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
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('اختار نوع الـ Widget ...', style: TextStyles.bold19),
                Text(
                  '✦',
                  style: TextStyles.bold19.copyWith(
                    color: AppColors.lightseconderyColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              'كل نوع له حد كلمات مناسب لشاشة هاتفك 📱',
              style: TextStyles.semiBold13.copyWith(
                color: AppColors.seconderyColor,
              ),
            ),

            const SizedBox(height: 20),

            // Grid
            GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: WidgetType.values.asMap().entries.map((entry) {
                final type = entry.value;
                return WidgetTypePickerItem(
                      type: type,
                      onTap: () {
                        Navigator.of(context).pop();
                        selectedWidgetBottomSheet(
                          context: context,
                          onSelected: (type) {
                            onSend(type, {});
                          },
                        );
                      },
                    )
                    .animate(delay: (entry.key * 35).ms)
                    .fadeIn(duration: 250.ms)
                    .scale(
                      begin: const Offset(0.8, 0.8),
                      curve: Curves.easeOut,
                    );
              }).toList(),
            ),
          ],
        ),
      );
    },
  );
}
