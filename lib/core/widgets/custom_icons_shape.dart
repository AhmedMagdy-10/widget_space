import 'package:flutter/material.dart';
import 'package:widget_space/core/utils/app_colors.dart';

class CustomIconShape extends StatelessWidget {
  const CustomIconShape({super.key, required this.icon, required this.onTap});
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),

        color: const Color(0xFFE0E5EC),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(4, 4),
            blurRadius: 10,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4),
            blurRadius: 10,
          ),
        ],
      ),

      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          radius: 18,
          backgroundColor: Colors.transparent,
          child: Icon(icon, size: 18, color: AppColors.seconderyColor),
        ),
      ),
    );
  }
}
