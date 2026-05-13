import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widget_space/core/utils/app_text_styles.dart';

class SocialLoginButton extends StatefulWidget {
  const SocialLoginButton({
    super.key,
    required this.onPressed,
    required this.image,
    required this.title,
  });

  final void Function() onPressed;
  final String image;
  final String title;

  @override
  State<SocialLoginButton> createState() => _SocialLoginButtonState();
}

class _SocialLoginButtonState extends State<SocialLoginButton> {
  bool _isPressed = false;

  // لون الخلفية الأساسي (يجب أن يطابق خلفية التطبيق لنجاح التأثير)
  final Color backgroundColor = const Color(0xFFF1F1F5);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 4,
        ), // لضبط المسافة الداخلية
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: _isPressed
              ? [
                  // تأثير الحفر للداخل عند الضغط (Inset Shadow)
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(4, 4),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                ]
              : [
                  // تأثير البروز للخارج في الحالة العادية (Outset Shadow)
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    offset: const Offset(8, 8),
                    blurRadius: 16,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-8, -8),
                    blurRadius: 16,
                  ),
                ],
        ),
        child: ListTile(
          visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
          leading: SvgPicture.asset(widget.image),
          title: Text(
            textAlign: TextAlign.center,
            widget.title,
            style: TextStyles.semiBold16,
          ),
        ),
      ),
    );
  }
}
