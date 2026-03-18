import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:widget_space/core/services/firebase_auth_service.dart';
import 'package:widget_space/core/widgets/skeuo_container.dart';
import 'package:widget_space/feature/auth/presentation/view/login_view.dart';
import 'package:widget_space/feature/home/Ui/views/main_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  // اللون الأساسي للخلفية والحاويات في نمط Skeuomorphism
  final Color backgroundColor = const Color(0xFFE0E5EC);

  @override
  void initState() {
    super.initState();
    excuteNavigation(); // تنفيذ التنقل بعد تأخير معين

    // إعداد الـ Controller للنص (لم يتغير)
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0,
      end: -10, // يتحرك 10 بيكسل للأعلى
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // يجب أن تكون خلفية الشاشة بأكملها بنفس اللون
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 1. حاوية الـ Lottie Animation (بارزة للخارج)
          Center(
            child: SkeuoContainer(
              padding: const EdgeInsets.all(20),
              // جعل الحاوية دائرية لتناسب الـ Lottie إذا كان دائرياً أو مربعاً بحواف ناعمة
              borderRadius: BorderRadius.circular(150),
              child: LottieBuilder.asset(
                'assets/images/Chat.json',
                width: 200, // تحديد العرض ليناسب الحاوية
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 50), // مسافة كبيرة بين العناصر
          // 2. حاوية النص (محفورة للداخل - Inset Effect)
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return SkeuoContainer(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
                isInset: true, // تفعيل تأثير الحفر للداخل
                child: Row(
                  mainAxisSize: MainAxisSize.min, // لتأخذ الحاوية حجم النص فقط
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // الكلمة الأولى: Widget
                    Transform.translate(
                      offset: Offset(0, _animation.value),
                      child: const Text(
                        'Space ',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: Color(0Xff2D9F5D),
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),

                    // الكلمة الثانية: Space
                    Transform.translate(
                      offset: Offset(0, -_animation.value),
                      child: const Text(
                        'Widget',
                        style: TextStyle(
                          fontSize: 28, // تكبير الخط قليلاً
                          fontWeight: FontWeight.w900, // خط سميك جداً
                          color: Colors.lightBlueAccent,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void excuteNavigation() {
    Future.delayed(Duration(seconds: 3), () {
      if (FirebaseAuthService().isUserLoggedIn()) {
        Navigator.pushReplacementNamed(context, MainView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      }
    });
  }
}
