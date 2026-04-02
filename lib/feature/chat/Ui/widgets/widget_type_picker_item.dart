import 'package:flutter/material.dart';
import 'package:widget_space/core/helper/widgets_type.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/core/utils/app_text_styles.dart';

class WidgetTypePickerItem extends StatelessWidget {
  final WidgetType type;
  final VoidCallback onTap;

  const WidgetTypePickerItem({
    super.key,
    required this.type,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            // الظل الغامق للأسفل واليمين
            const BoxShadow(
              color: AppColors.shadowDark,
              offset: Offset(4, 4),
              blurRadius: 8,
            ),
            // الظل الفاتح للأعلى واليسار (تأثير الضوء)
            const BoxShadow(
              color: AppColors.shadowLight,
              offset: Offset(-4, -4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [
                  Text(
                    type.emoji,
                    style: TextStyles.bold28.copyWith(fontSize: 35),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    type.label,
                    textAlign: TextAlign.center,
                    style: TextStyles.semiBold13.copyWith(
                      fontSize: 14,

                      color: AppColors.text,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 6),

            Positioned(
              top: -6,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.lightseconderyColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  type.limit.limitLabel,
                  textAlign: TextAlign.center,
                  style: TextStyles.medium12.copyWith(
                    color: AppColors.lightseconderyColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
