import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // إعداد الـ Controller للتحكم في سرعة الحركة
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true); // التكرار مع العودة (ذهاب وإياب)

    // إعداد الـ Animation لتحديد المسافة (مثلاً يتحرك 10 بيكسل للأعلى)
    _animation = Tween<double>(
      begin: 0,
      end: -10,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose(); // إغلاق الـ controller للحفاظ على الذاكرة
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // عرض الـ Lottie Animation
        LottieBuilder.asset('assets/images/Chat.json'),

        const SizedBox(height: 20), // مسافة بسيطة بين الـ Lottie والنص

        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // الكلمة الأولى: Widget
                Transform.translate(
                  offset: Offset(0, _animation.value), // التحريك الرأسي
                  child: const Text(
                    'Widget ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                ),

                // الكلمة الثانية: Space
                Transform.translate(
                  // لإعطاء تأثير الـ "Dot typing" الحقيقي، سنقوم بعكس الحركة
                  // أو تأخيرها قليلاً باستخدام قيمة سالبة للـ animation
                  offset: Offset(0, -_animation.value),
                  child: const Text(
                    'Space',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0Xff2D9F5D),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
