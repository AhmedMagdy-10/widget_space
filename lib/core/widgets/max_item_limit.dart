import 'package:flutter/material.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/core/utils/app_text_styles.dart';

class MaxItemLimit extends StatelessWidget {
  const MaxItemLimit({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.lightseconderyColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          color: AppColors.lightseconderyColor.withValues(alpha: 0.2),
        ),
      ),
      child: Center(
        child: Text(
          message,
          style: TextStyles.bold13.copyWith(
            color: AppColors.lightseconderyColor,
          ),
        ),
      ),
    );
  }
}
