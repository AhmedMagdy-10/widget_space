import 'package:flutter/material.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/core/utils/app_text_styles.dart';
import 'package:widget_space/core/utils/box_shadow.dart';

class LimitProgressBar extends StatelessWidget {
  final int current;
  final int max;
  final String? label;
  final bool isOver;

  const LimitProgressBar({
    super.key,
    required this.current,
    required this.max,
    this.label,
    required this.isOver,
  });

  double get _progress => (current / max).clamp(0.0, 1.0);

  // منطق الألوان: أخضر للطبيعي، أصفر للتحذير، أحمر للنهاية
  Color get _color {
    if (_progress < 0.7) return const Color(0xFF2ED573); // أخضر مريح
    if (_progress < 0.9) return const Color(0xFFF5C518); // أصفر
    return Colors.red; // أحمر
  }

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        label ?? '$current/$max',
        style: TextStyles.bold13.copyWith(
          color: _color,
          fontWeight: FontWeight.w800,
          fontSize: 12,
        ),
      ),

      const SizedBox(width: 10),

      Expanded(
        child: Container(
          height: 6, // زدت الارتفاع قليلاً ليظهر تأثير الحفر بوضوح
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primaryColor, // خلفية الحفرة
          ),
          child: Stack(
            children: [
              // 1. شريط التقدم (الخلفية الملونة)
              LinearProgressIndicator(
                value: _progress,
                backgroundColor:
                    Colors.transparent, // شفافة لنرى لون الـ Container
                valueColor: AlwaysStoppedAnimation(_color),
                minHeight: 6,
              ),

              // 2. طبقة الظل الداخلي (Inset Shadow) لخلق إيحاء الحفر
              // نستخدم Container مع حدود (Border) وظل خفيف
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: BoxShadowUtils.inset, // ظل داخلي يعطي تأثير الحفر
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
