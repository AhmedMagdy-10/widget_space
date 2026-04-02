import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widget_space/core/helper/widgets_type.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/core/utils/app_text_styles.dart';
import 'package:widget_space/core/widgets/skeuo_container.dart';

class LimitedBanner extends StatelessWidget {
  const LimitedBanner({super.key, required this.type});

  final WidgetType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF6C63FF).withValues(alpha: 0.10),
            Color(0xFF6C63FF).withValues(alpha: 0.4),
          ],
        ),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: AppColors.lightseconderyColor.withValues(alpha: 0.18),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          SkeuoContainer(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            borderRadius: BorderRadius.circular(12),
            isInset: true,
            child: Column(
              children: [
                Text(
                  type.limit.limitLabel,
                  style: const TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF6C63FF),
                  ),
                ),

                Text(
                  'الحد',
                  style: TextStyles.regular13.copyWith(color: AppColors.text),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'حد الظهر علي الشاشة الرئسية',
                  style: TextStyles.bold13.copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppColors.lightseconderyColor,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'قد يختلف حسب نوع الـ Widget وحجم الشاشة',
                  style: TextStyles.medium12.copyWith(
                    fontSize: 11,
                    color: AppColors.seconderyColor,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '📱',
            style: TextStyle(
              fontSize: 30,
              fontFamily: GoogleFonts.notoColorEmoji().fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
