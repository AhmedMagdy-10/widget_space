import 'package:flutter/material.dart';
import 'package:widget_space/core/utils/app_colors.dart';

class SkeuoContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final bool isInset;
  final double? width;

  const SkeuoContainer({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.isInset = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: borderRadius ?? BorderRadius.circular(20),
        boxShadow: isInset
            ? [
                BoxShadow(
                  color: Colors.white.withValues(alpha: 0.9),
                  offset: const Offset(4, 4),
                  blurRadius: 4,
                  spreadRadius: -2,
                ),
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  offset: const Offset(-4, -4),
                  blurRadius: 4,
                  spreadRadius: -2,
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  offset: const Offset(9, 9),
                  blurRadius: 16,
                ),
                const BoxShadow(
                  color: Colors.white,
                  offset: Offset(-9, -9),
                  blurRadius: 16,
                ),
              ],
      ),
      child: child,
    );
  }
}
