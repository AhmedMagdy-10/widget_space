import 'package:flutter/material.dart';
import 'package:widget_space/core/utils/app_colors.dart';

class AnimatedSkeuoFAB extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const AnimatedSkeuoFAB({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  State<AnimatedSkeuoFAB> createState() => _AnimatedSkeuoFABState();
}

class _AnimatedSkeuoFABState extends State<AnimatedSkeuoFAB>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.9,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPointerDown(PointerDownEvent event) {
    setState(() => _isPressed = true);
    _controller.forward();
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() => _isPressed = false);
    _controller.reverse();
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    // الألوان المفضلة للـ Skeuomorphism هي الرمادي الفاتح جداً أو "Off-white"
    Color backgroundColor = const Color(0xFFE0E0E0);

    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            boxShadow: _isPressed
                ? [
                    // ظل داخلي عند الضغط (Button pressed in)
                    BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(5, 5),
                      color: Colors.grey.shade500,
                    ),
                    const BoxShadow(
                      blurRadius: 10,
                      offset: Offset(-5, -5),
                      color: Colors.white,
                    ),
                  ]
                : [
                    // ظل خارجي عند البروز (Button popping out)
                    BoxShadow(
                      blurRadius: 10,
                      offset: const Offset(5, 5),
                      color: Colors.grey.shade500,
                    ),
                    const BoxShadow(
                      blurRadius: 10,
                      offset: Offset(-5, -5),
                      color: Colors.grey,
                    ),
                  ],
          ),
          child: Icon(widget.icon, color: AppColors.seconderyColor, size: 25),
        ),
      ),
    );
  }
}
