import 'package:flutter/material.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/core/utils/app_text_styles.dart';

class HaveAccountWidget extends StatelessWidget {
  const HaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'تمتلك حساب بالفعل ؟ ',
          style: TextStyles.semiBold16.copyWith(color: Color(0xFF949D9E)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            'تسجيل دخول',
            style: TextStyles.semiBold16.copyWith(
              color: AppColors.seconderyColor,
            ),
          ),
        ),
      ],
    );
  }
}
