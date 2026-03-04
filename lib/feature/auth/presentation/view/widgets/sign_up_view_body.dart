import 'package:flutter/material.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/core/widgets/build_custom_app_bar.dart';
import 'package:widget_space/core/widgets/custom_button.dart';
import 'package:widget_space/core/widgets/skeuo_container.dart';
import 'package:widget_space/feature/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:widget_space/feature/auth/presentation/view/widgets/have_an_account.dart';
import 'package:widget_space/feature/auth/presentation/view/widgets/terms_and_conditions_widget.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
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
          children: [
            buildAppBar(context, 'حساب جديد'),
            SizedBox(height: 40),
            const SkeuoContainer(
              padding: EdgeInsets.all(16),

              child: Icon(
                Icons.person_add_alt_1_rounded,
                size: 50,
                color: AppColors.seconderyColor,
              ),
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              suffixIcon: Icon(
                Icons.person_outline,
                color: AppColors.seconderyColor,
              ),
              hintText: 'الاسم الكامل',
              textInputType: TextInputType.name,
              controller: nameController,
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              hintText: 'البريد الإلكتروني',
              suffixIcon: Icon(
                Icons.email_outlined,
                color: AppColors.seconderyColor,
              ),
              textInputType: TextInputType.emailAddress,
              controller: emailController,
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              suffixIcon: Icon(
                Icons.visibility_off,
                color: AppColors.seconderyColor,
              ),
              hintText: 'كلمة المرور',
              textInputType: TextInputType.visiblePassword,
              controller: passwordController,
              obscureText: true,
            ),
            SizedBox(height: 16),
            TermsAndConditionsWidget(
              onChanged: (isChecked) {
                // يمكنك التعامل مع حالة الموافقة هنا إذا لزم الأمر
              },
            ),

            SizedBox(height: 30),

            CustomButton(onPressed: () {}, data: 'إنشاء حساب'),
            SizedBox(height: 20),

            HaveAccountWidget(),
          ],
        ),
      ),
    );
  }
}
