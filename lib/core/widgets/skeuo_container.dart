import 'package:flutter/material.dart';

class SkeuoContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets? padding;

  const SkeuoContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: const Color(0xFFE0E5EC),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          // الظل الغامق (أسفل اليمين)
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(9, 9),
            blurRadius: 16,
          ),
          // الإضاءة الفاتحة (أعلى اليسار)
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
