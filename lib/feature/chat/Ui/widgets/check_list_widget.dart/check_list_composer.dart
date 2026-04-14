import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/core/utils/app_text_styles.dart';
import 'package:widget_space/core/utils/box_shadow.dart';
import 'package:widget_space/core/widgets/field_label.dart';

class CheckListComposer extends StatefulWidget {
  const CheckListComposer({super.key, required this.onSend});
  final void Function(Map<String, dynamic>) onSend;
  @override
  State<CheckListComposer> createState() => _CheckListComposerState();
}

class _CheckListComposerState extends State<CheckListComposer> {
  final TextEditingController titleCtrl = TextEditingController();
  final _items = <String>['خبز وجبن', 'حليب وزبادي'];
  static const _maxItems = 4;
  final TextEditingController _itemCtrl = TextEditingController();

  @override
  void dispose() {
    titleCtrl.dispose();
    _itemCtrl.dispose();
    super.dispose();
  }

  void _addItem() {
    final val = _itemCtrl.text.trim();
    if (val.isEmpty || _items.length >= _maxItems) return;
    HapticFeedback.lightImpact();
    setState(() {
      _items.add(val);
      _itemCtrl.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldLabel(label: 'عنوان القائمة 📋'),

        _NeuInput(ctrl: titleCtrl, hint: 'مثال: طلبات البيت 🛒'),
        SizedBox(height: 12),

        Row(children: [FieldLabel(label: 'العناصر')]),
        const SizedBox(height: 8),
      ],
    );
  }
}

class _NeuInput extends StatefulWidget {
  final TextEditingController ctrl; // تأكد من أنه ليس نال هنا للتحكم بالأداء
  final String hint;
  final VoidCallback? onSubmit;

  const _NeuInput({required this.ctrl, required this.hint, this.onSubmit});

  @override
  State<_NeuInput> createState() => _NeuInputState();
}

class _NeuInputState extends State<_NeuInput> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    // مراقبة حالة التركيز لتغيير التصميم فورياً
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
    // تحديد ما إذا كان الحقل "نشط" (إما فيه نص أو عليه التركيز)
    bool isActive = _isFocused || widget.ctrl.text.isNotEmpty;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          // تغيير لون الإطار للأزرق عند الكتابة أو التركيز
          color: isActive ? Colors.blue : Colors.transparent,
          width: 1.5,
        ),
        boxShadow: isActive
            ? [
                // تأثير البارز (Raised)
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ]
            :
              // تأثير المحفور (Inset Shadow)
              BoxShadowUtils.inset,
      ),
      child: TextField(
        controller: widget.ctrl,
        focusNode: _focusNode,
        onSubmitted: (_) => widget.onSubmit?.call(),
        onChanged: (_) => setState(() {}), // لتحديث الحالة عند بدء الكتابة
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
