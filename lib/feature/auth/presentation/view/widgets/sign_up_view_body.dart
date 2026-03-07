import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_space/core/helper/show_toast_state.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/core/widgets/custom_button.dart';
import 'package:widget_space/core/widgets/skeuo_container.dart';
import 'package:widget_space/feature/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:widget_space/feature/auth/presentation/view/widgets/have_an_account.dart';
import 'package:widget_space/feature/auth/presentation/view/widgets/terms_and_conditions_widget.dart';

import '../../manager/signup_cubit/sign_up_cubit.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, userName, password;
  bool isPasswordVisible = false;
  bool isTermsAccepted = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 24),
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
                onSaved: (value) {
                  // يمكنك التعامل مع القيمة المحفوظة هنا إذا لزم الأمر
                  userName = value!;
                },
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                hintText: 'البريد الإلكتروني',
                suffixIcon: Icon(
                  Icons.email_outlined,
                  color: AppColors.seconderyColor,
                ),
                textInputType: TextInputType.emailAddress,
                onSaved: (value) {
                  // يمكنك التعامل مع القيمة المحفوظة هنا إذا لزم الأمر
                  email = value!;
                },
              ),
              SizedBox(height: 20),
              CustomTextFormField(
                suffixIcon: GestureDetector(
                  onTap: () {
                    // يمكنك تعريف سلوك عند النقر على أيقونة العين هنا
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  child: isPasswordVisible
                      ? Icon(
                          Icons.visibility_off,
                          color: AppColors.seconderyColor,
                        )
                      : Icon(Icons.visibility, color: AppColors.seconderyColor),
                ),
                hintText: 'كلمة المرور',
                textInputType: TextInputType.visiblePassword,
                obscureText: isPasswordVisible,
                onSaved: (value) {
                  // يمكنك التعامل مع القيمة المحفوظة هنا إذا لزم الأمر
                  password = value!;
                },
              ),
              SizedBox(height: 16),
              TermsAndConditionsWidget(
                onChanged: (isChecked) {
                  // يمكنك التعامل مع حالة الموافقة هنا إذا لزم الأمر
                  setState(() {
                    isTermsAccepted = isChecked;
                  });

                  print('isTermsAccepted: $isTermsAccepted');
                },
              ),

              SizedBox(height: 30),

              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAccepted) {
                      context
                          .read<SignUpCubit>()
                          .createUserWithEmailAndPassword(
                            email,
                            password,
                            userName,
                          );
                    } else {
                      showToast(
                        text: 'يرجى الموافقة على الشروط والأحكام.',
                        state: ToastStates.error,
                      );
                    }
                    // إذا كانت جميع الحقول صحيحة، يمكنك تنفيذ عملية التسجيل هنا  }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                data: 'إنشاء حساب',
              ),
              SizedBox(height: 20),

              HaveAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
