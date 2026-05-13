import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widget_space/core/helper/widgets_type.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/core/utils/app_text_styles.dart';

class SendButton extends StatefulWidget {
  final WidgetType type;
  final bool enabled;
  final VoidCallback onTap;
  const SendButton({
    super.key,
    required this.type,
    required this.enabled,
    required this.onTap,
  });

  @override
  State<SendButton> createState() => _SendButtonState();
}

class _SendButtonState extends State<SendButton> {
  bool _pressed = false;

  List<BoxShadow> _buildEnabledShadows() {
    return [
      BoxShadow(
        color: AppColors.lightseconderyColor.withValues(alpha: 0.4),
        offset: const Offset(4, 4),
        blurRadius: 15,
        spreadRadius: 1,
      ),
      BoxShadow(
        color: const Color(0x66B4AAFF),
        offset: const Offset(-4, -4),
        blurRadius: 10,
      ),
      BoxShadow(
        color: Colors.white.withValues(alpha: 0.5),
        offset: const Offset(0, 1),
        blurRadius: 0,
      ),
    ];
  }

  List<BoxShadow> _buildPressedShadows() {
    return [
      BoxShadow(
        color: AppColors.seconderyColor.withValues(alpha: 0.15),
        offset: const Offset(1, 1),
        blurRadius: 3,
        spreadRadius: 1,
      ),
      BoxShadow(
        color: Colors.white.withValues(alpha: 0.2),
        offset: const Offset(-1, -1),
        blurRadius: 3,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final Color buttonColor = widget.enabled
        ? (_pressed ? Colors.white.withValues(alpha: 0.95) : Colors.white)
        : AppColors.seconderyColor.withValues(alpha: 0.1);

    return GestureDetector(
      onTapDown: (_) {
        if (!widget.enabled) return;
        setState(() => _pressed = true);
        HapticFeedback.mediumImpact();
      },
      onTapUp: (_) {
        if (!widget.enabled) return;
        setState(() => _pressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: widget.enabled
              ? (_pressed ? _buildPressedShadows() : _buildEnabledShadows())
              : [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.05),
                    blurRadius: 1,
                  ),
                ],
          border: widget.enabled
              ? null
              : Border.all(
                  color: Colors.grey.withValues(alpha: 0.1),
                  width: 0.5,
                ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'أرسل ${widget.type.label} ',
              style: TextStyles.bold16.copyWith(
                color: widget.enabled
                    ? Colors.black.withValues(alpha: 0.85) // لون أكثر نعومة
                    : AppColors.seconderyColor,
              ),
            ),
            const SizedBox(width: 10),
            Text(widget.type.emoji, style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
