import 'package:flutter/material.dart';
import 'package:widget_space/core/utils/app_colors.dart';

class DateDivider extends StatelessWidget {
  final String label;
  const DateDivider({super.key, required this.label});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        Expanded(
          child: Container(height: 1, color: Colors.black.withOpacity(0.08)),
        ),
        const SizedBox(width: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowDark,
                offset: Offset(2, 2),
                blurRadius: 5,
              ),
              BoxShadow(
                color: AppColors.shadowLight,
                offset: Offset(-2, -2),
                blurRadius: 5,
              ),
            ],
          ),
          child: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Tajawal',
              fontSize: 10,
              color: AppColors.lightseconderyColor,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(height: 1, color: Colors.black.withOpacity(0.08)),
        ),
      ],
    ),
  );
}
