import 'package:flutter/material.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/core/utils/app_text_styles.dart';
import 'package:widget_space/feature/auth/presentation/view/sign_up_view.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'لا تمتلك حساب ؟',
          style: TextStyles.semiBold16.copyWith(color: Color(0xFF949D9E)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SignUpView.routeName);
          },
          child: Text(
            'قم بانشاء حساب ',
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.seconderyColor,
            ),
          ),
        ),
      ],
    );
  }
}
