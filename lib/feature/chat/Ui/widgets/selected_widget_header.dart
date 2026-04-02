import 'package:flutter/material.dart';
import 'package:widget_space/core/helper/widgets_type.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/core/utils/app_text_styles.dart';
import 'package:widget_space/core/widgets/custom_icons_shape.dart';
import 'package:widget_space/feature/chat/Ui/widgets/custom_widgets_button_sheet.dart';

class SelectedWidgetHeader extends StatelessWidget {
  const SelectedWidgetHeader({super.key, required this.type});

  final WidgetType type;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
          decoration: BoxDecoration(
            color: type.badgeBg,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            type.limit.limitLabel,
            style: TextStyles.bold13.copyWith(
              fontSize: 12,
              color: type.badgeColor,
            ),
          ),
        ),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${type.label}  ${type.emoji}',
                style: TextStyles.bold16.copyWith(fontSize: 18),
              ),
              SizedBox(height: 5),
              Text(
                'قم بتخصيص بيانات الـ Widget الخاص بك ...',
                style: TextStyles.semiBold11.copyWith(
                  color: AppColors.seconderyColor,
                ),
              ),
            ],
          ),
        ),

        SizedBox(width: 10),
        CustomIconShape(
          icon: Icons.arrow_forward_ios_outlined,
          onTap: () {
            Navigator.of(context).pop();
            showWidgetPicker(context: context, onSend: (type, data) {});
          },
        ),
      ],
    );
  }
}
