import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class StreakCard extends StatelessWidget {
  const StreakCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF6E3), // خلفية دافئة
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFA07820).withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // عنوان القسم
          const Text(
            'STREAK',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Color(0xFFA07820),
              letterSpacing: 1.5,
            ),
          ),

          const SizedBox(height: 15),

          // الحلقة المركزية (مبسطة باستخدام Stack و CircularProgress)
          _buildSimplifiedRing(),

          const SizedBox(height: 15),

          // النصوص التوضيحية
          const Text(
            'يوم متواصل',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF7A5C00),
            ),
          ),
          const Text(
            'مع سارة 💙',
            style: TextStyle(fontSize: 12, color: Color(0xFFC8A060)),
          ),

          const SizedBox(height: 15),

          // النقاط الـ 7 (أيام الأسبوع)
          _buildSimpleDots(),
        ],
      ),
    ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.1);
  }

  // بناء الحلقة بدون CustomPaint معقد
  Widget _buildSimplifiedRing() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // الحلقة الخارجية
        SizedBox(
          width: 80,
          height: 80,
          child: CircularProgressIndicator(
            value: 0.7, // قيمة ثابتة للعرض فقط
            strokeWidth: 6,
            backgroundColor: const Color(0xFFE0E0E0),
            valueColor: AlwaysStoppedAnimation<Color>(const Color(0xFFF5C518)),
          ),
        ),
        // المحتوى الداخلي
        const Column(
          children: [
            Text('🔥', style: TextStyle(fontSize: 20)),
            Text(
              '12',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Color(0xFF7A5C00),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // بناء النقاط ببساطة
  Widget _buildSimpleDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(7, (index) {
        return Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
            color: index < 4
                ? const Color(0xFFF5C518)
                : const Color(0xFFE0E0E0),
            shape: BoxShape.circle,
          ),
        ).animate(delay: (index * 100).ms).scale();
      }),
    );
  }
}
