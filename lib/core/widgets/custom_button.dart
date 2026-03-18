import 'package:flutter/material.dart';
import 'package:widget_space/core/utils/app_colors.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.data,
    this.isInset = false, // القيمة الافتراضية بارز للخارج
  });

  final void Function() onPressed;
  final String data;
  final bool isInset;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    // تحديد ألوان الظلال بناءً على اللون الأساسي (Primary Color)
    // في الـ Skeuomorphism نحتاج لون أغمق قليلاً ولون أفتح (إضاءة)
    final Color highlightColor = Colors.white.withOpacity(0.3);

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: 54,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.seconderyColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: (widget.isInset || _isPressed)
              ? [
                  // 🕳️ تأثير المحفور للداخل (Inset Shadow)
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(4, 4),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: highlightColor,
                    offset: const Offset(-4, -4),
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ]
              : [
                  // ⛰️ تأثير البارز للخارج (Outset Shadow)
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(6, 6),
                    blurRadius: 12,
                  ),
                  BoxShadow(
                    color: highlightColor,
                    offset: const Offset(-6, -6),
                    blurRadius: 12,
                  ),
                ],
        ),
        child: Center(
          child: Text(
            widget.data,
            style: const TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
