import 'package:flutter/material.dart';
import 'package:widget_space/core/utils/app_text_styles.dart';
import 'package:widget_space/core/widgets/custom_icons_shape.dart';

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
      icon: CustomIconShape(icon: Icons.arrow_back_ios_new),
    ),
  );
}
