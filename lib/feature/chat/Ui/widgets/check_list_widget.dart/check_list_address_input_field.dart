import 'package:flutter/material.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/core/utils/app_text_styles.dart';
import 'package:widget_space/core/utils/box_shadow.dart';

class NeuInput extends StatefulWidget {
  final TextEditingController ctrl;
  final String hint;
  final VoidCallback? onSubmit;

  const NeuInput({
    super.key,
    required this.ctrl,
    required this.hint,
    this.onSubmit,
  });

  @override
  State<NeuInput> createState() => _NeuInputState();
}

class _NeuInputState extends State<NeuInput> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isActive = _isFocused || widget.ctrl.text.isNotEmpty;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isActive ? Colors.blue : Colors.transparent,
          width: 1.5,
        ),
        boxShadow: isActive
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ]
            : BoxShadowUtils.inset,
      ),
      child: TextField(
        controller: widget.ctrl,
        focusNode: _focusNode,
        onSubmitted: (_) => widget.onSubmit?.call(),
        onChanged: (_) => setState(() {}),
        style: TextStyles.bold13.copyWith(
          color: AppColors.text,
          fontWeight: FontWeight.w900,
        ),
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: const TextStyle(color: AppColors.textHint),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 12,
          ),
          isDense: true,
        ),
      ),
    );
  }
}
