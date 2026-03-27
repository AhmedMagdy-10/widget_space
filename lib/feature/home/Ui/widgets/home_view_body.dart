import 'package:flutter/material.dart';
import 'package:widget_space/core/utils/app_text_styles.dart';
import 'package:widget_space/feature/auth/presentation/view/widgets/tagline_banner.dart';
import 'package:widget_space/feature/auth/presentation/view/widgets/user_profile_header.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TaglineBanner(),
            SizedBox(height: 20),
            EliteUserProfileHeader(),

            Padding(
              padding: const EdgeInsets.only(
                top: 5,
                bottom: 5,
                left: 16,
                right: 16,
              ),
              child: Text(
                'اخر اللحظات ...✦ ',
                style: TextStyles.bold16.copyWith(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
