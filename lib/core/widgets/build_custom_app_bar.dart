import 'package:flutter/material.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/core/utils/app_text_styles.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(title, style: TextStyles.bold19.copyWith()),
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE0E5EC),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(4, 4),
              blurRadius: 10,
            ),
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 10,
            ),
          ],
        ),

        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 20,
            color: AppColors.seconderyColor,
          ),
        ),
      ),
    ),
  );
}
