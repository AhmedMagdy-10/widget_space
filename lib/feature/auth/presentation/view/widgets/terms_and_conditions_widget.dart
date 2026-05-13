import 'package:flutter/material.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/core/utils/app_text_styles.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.translate(
          offset: Offset(14, 0),
          child: Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(4),
            ),
            side: BorderSide(width: 1.5, color: Color(0xFF949D9E)),
            visualDensity: VisualDensity(
              horizontal: VisualDensity.minimumDensity,
            ),
            value: isChecked,

            onChanged: (newValue) {
              setState(() {
                isChecked = newValue!;
              });
              widget.onChanged(isChecked);
            },
          ),
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: TextStyles.semiBold13.copyWith(
                    color: Color(0xff616A6B),
                  ),
                ),
                TextSpan(
                  text: 'الشروط والأحكام الخاصة بنا',
                  style: TextStyles.semiBold13.copyWith(
                    color: AppColors.lightseconderyColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
