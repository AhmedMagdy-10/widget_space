import 'package:flutter/material.dart';
import 'package:widget_space/core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Color(0xFF949D9E))),
        SizedBox(width: 18),
        Text('او', style: TextStyles.semiBold16, textAlign: TextAlign.center),
        SizedBox(width: 18),
        Expanded(child: Divider(color: Color(0xFF949D9E))),
      ],
    );
  }
}
