import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/core/utils/app_text_styles.dart';
import 'package:widget_space/core/utils/box_shadow.dart';

class TextNoteArea extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final int maxLines;
  final void Function(String)? onChanged;

  const TextNoteArea({
    super.key,
    this.controller,
    required this.hint,
    this.maxLines = 3,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: Colors.white.withValues(alpha: 0.9),
      borderRadius: BorderRadius.circular(14),
      boxShadow: BoxShadowUtils.inset,
    ),
    child: TextField(
      inputFormatters: [LengthLimitingTextInputFormatter(80)],
      controller: controller,
      onChanged: onChanged,
      maxLines: maxLines,
      minLines: maxLines,
      style: TextStyles.bold16.copyWith(color: AppColors.textHint),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyles.bold16.copyWith(color: AppColors.textHint),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.all(13),
        isDense: true,
      ),
    ),
  );
}
