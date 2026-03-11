import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/core/widgets/build_custom_app_bar.dart';
import 'package:widget_space/core/widgets/custom_button.dart';
import 'package:widget_space/core/widgets/skeuo_container.dart';
import 'package:widget_space/feature/auth/presentation/manager/login_cubit/login_cubit.dart';
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
  @override
  void dispose() {
    super.dispose();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
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
                onSaved: (value) {
                  email = value!;
                },
                suffixIcon: Icon(
                  Icons.email_outlined,
                  color: AppColors.seconderyColor,
                ),
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                onSaved: (value) {
                  password = value!;
                },
                obscureText: isPasswordVisible,
                hintText: 'كلمة المرور',
                textInputType: TextInputType.visiblePassword,
                suffixIcon: GestureDetector(
                  onTap: () {
                    // يمكنك تعريف سلوك عند النقر على أيقونة العين هنا
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  child: isPasswordVisible
                      ? Icon(Icons.visibility, color: AppColors.seconderyColor)
                      : Icon(
                          Icons.visibility_off,
                          color: AppColors.seconderyColor,
                        ),
                ),
              ),
              SizedBox(height: 20),

              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    // يمكنك تنفيذ عملية تسجيل الدخول هنا باستخدام القيم المحفوظة في المتغيرات email و password
                    context.read<LogInCubit>().signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                data: 'تسجيل الدخول',
              ),

              SizedBox(height: 20),
              DontHaveAccountWidget(),
              SizedBox(height: 30),

              OrDivider(),
              SizedBox(height: 31),
              SocialLoginButton(
                onPressed: () {
                  context.read<LogInCubit>().signInWithGoogle();
                },
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
      ),
    );
  }
}
