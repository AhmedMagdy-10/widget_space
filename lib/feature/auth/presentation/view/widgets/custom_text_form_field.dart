import 'package:flutter/material.dart';
import 'package:widget_space/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    required this.controller,
    this.onSaved,
    this.obscureText = false,
  });

  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final void Function(String?)? onSaved;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE0E5EC),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.8),
            offset: const Offset(5, 5),
            blurRadius: 3,
            spreadRadius: -3,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            offset: const Offset(-3, -3),
            blurRadius: 3,
            spreadRadius: -3,
          ),
        ],
      ),
      child: TextFormField(
        obscureText: obscureText,
        onSaved: onSaved,
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'هذا الحقل مطلوب';
          }
          return null;
        },
        keyboardType: textInputType,
        style: TextStyles.bold13.copyWith(
          color: Colors.black,
        ), // لون النص المدخل
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyles.bold13.copyWith(color: const Color(0xFF949D9E)),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
        ),
      ),
    );
  }
}
