import 'package:flutter/material.dart';
import 'package:widget_space/core/utils/app_colors.dart';

abstract class BoxShadowUtils {
  static List<BoxShadow> get inset => _inset;
  static List<BoxShadow> get raised => _raised;
}

// ── Shadows ──────────────────────────────────
const _raised = [
  BoxShadow(color: AppColors.shadowDark, offset: Offset(4, 4), blurRadius: 9),
  BoxShadow(color: Colors.white, offset: Offset(-4, -4), blurRadius: 9),
  BoxShadow(color: Colors.white, offset: Offset(0, 1), blurRadius: 0),
];

List<BoxShadow> get _inset => [
  BoxShadow(
    color: Colors.black.withOpacity(0.15),
    offset: const Offset(-1, -1),
    blurRadius: 3,
  ),
  BoxShadow(
    color: Colors.white.withOpacity(0.8),
    offset: const Offset(1, 1),
    blurRadius: 2,
  ),
];
