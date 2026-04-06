import 'package:flutter/material.dart';

abstract class BoxShadowUtils {
  static List<BoxShadow> get inset => _inset;
}

final List<BoxShadow> _inset = [
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
];
