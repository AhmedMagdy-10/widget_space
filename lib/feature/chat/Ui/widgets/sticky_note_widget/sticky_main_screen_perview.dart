import 'package:flutter/material.dart';
import 'package:widget_space/core/utils/app_text_styles.dart';
import 'package:widget_space/core/widgets/skeuo_container.dart';

class StickyMainScreenPerview extends StatelessWidget {
  const StickyMainScreenPerview({
    super.key,
    required TextEditingController ctrl,
  }) : _ctrl = ctrl;

  final TextEditingController _ctrl;

  @override
  Widget build(BuildContext context) {
    return SkeuoContainer(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
      child: Column(
        children: [
          Text(
            ' معاينة على الشاشة الرئيسية  📝',
            textAlign: TextAlign.end,
            style: TextStyles.bold13.copyWith(
              color: Color(0xFFa09000),
              fontWeight: FontWeight.w900,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 5),
          Divider(height: 1, color: Colors.grey[400]),
          SizedBox(height: 16),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Transform.rotate(
                angle: -0.015,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(13, 12, 13, 11),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFFEFBC5), Color(0xFFFEF785)],
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(3),
                      topRight: Radius.circular(14),
                      bottomLeft: Radius.circular(14),
                      bottomRight: Radius.circular(14),
                    ),

                    boxShadow: [
                      BoxShadow(
                        color: Color(0x22000000),
                        offset: Offset(4, 4),
                        blurRadius: 10,
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'أنت ✦',
                        style: TextStyles.bold13.copyWith(
                          color: Color(0xFFA09000),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _ctrl.text.isEmpty ? 'اكتب هنا...' : _ctrl.text,
                        style: TextStyles.bold13.copyWith(
                          color: _ctrl.text.isEmpty
                              ? const Color(0xFFB0A010)
                              : const Color(0xFF333200),
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -10,
                right: 0,
                left: 0,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    '📌',
                    style: TextStyles.bold16,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
