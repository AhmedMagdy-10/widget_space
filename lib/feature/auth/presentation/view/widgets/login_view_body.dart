import 'package:flutter/material.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/core/widgets/build_custom_app_bar.dart';
import 'package:widget_space/core/widgets/custom_button.dart';
import 'package:widget_space/core/widgets/skeuo_container.dart';
import 'package:widget_space/feature/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:widget_space/feature/auth/presentation/view/widgets/dont_have_account_widget.dart';
import 'package:widget_space/feature/auth/presentation/view/widgets/or_divider.dart';
import 'package:widget_space/feature/auth/presentation/view/widgets/social_login_button.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildAppBar(context, 'تسجيل الدخول'),
            SizedBox(height: 40),
            SkeuoContainer(
              padding: const EdgeInsets.all(16),
              child: Icon(
                size: 50,
                Icons.lock_person_rounded,
                color: AppColors.seconderyColor,
              ),
            ),
            SizedBox(height: 20),

            CustomTextFormField(
              suffixIcon: Icon(
                Icons.email_outlined,
                color: AppColors.seconderyColor,
              ),
              hintText: 'البريد الإلكتروني',
              textInputType: TextInputType.emailAddress,
              controller: emailController,
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              controller: passwordController,
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
              suffixIcon: Icon(
                Icons.visibility_off,
                color: AppColors.seconderyColor,
              ),
            ),
            SizedBox(height: 20),

            CustomButton(onPressed: () {}, data: 'تسجيل الدخول'),

            SizedBox(height: 20),
            DontHaveAccountWidget(),
            SizedBox(height: 30),

            OrDivider(),
            SizedBox(height: 31),
            SocialLoginButton(
              onPressed: () {},
              image: 'assets/images/google_icon.svg',
              title: 'تسجيل الدخول باستخدام جوجل',
            ),
            SizedBox(height: 16),
            SocialLoginButton(
              onPressed: () {},
              image: 'assets/images/facebook_icon.svg',
              title: 'تسجيل الدخول باستخدام فيسبوك',
            ),
            SizedBox(height: 16),
            SocialLoginButton(
              onPressed: () {},
              image: 'assets/images/apple_icon.svg',
              title: 'تسجيل الدخول باستخدام أبل',
            ),
          ],
        ),
      ),
    );
  }
}
