import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widget_space/core/helper/widgets_type.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/core/utils/app_text_styles.dart';
import 'package:widget_space/core/utils/box_shadow.dart';
import 'package:widget_space/core/widgets/field_label.dart';
import 'package:widget_space/core/widgets/max_item_limit.dart';
import 'package:widget_space/feature/chat/Ui/widgets/check_list_widget.dart/check_list_address_input_field.dart';
import 'package:widget_space/feature/chat/Ui/widgets/widget_send_button.dart';

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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FieldLabel(label: 'عنوان القائمة 📋'),

          NeuInput(ctrl: titleCtrl, hint: 'مثال: طلبات البيت 🛒'),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FieldLabel(label: 'العناصر '),
              Text(
                '(${_items.length}/$_maxItems)',
                style: TextStyles.bold13.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w900,
                  color: AppColors.lightseconderyColor,
                ),
              ),
              Text(' ✅'),
            ],
          ),
          ..._items.asMap().entries.map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: BoxShadowUtils.raised,
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.4),
                    width: 1,
                  ),
                ),

                child: Row(
                  children: [
                    const Icon(
                      Icons.drag_indicator_rounded,
                      size: 18,
                      color: AppColors.textHint,
                    ),
                    const SizedBox(width: 12),

                    Expanded(child: Text(item.value, style: TextStyles.bold13)),
                    Material(
                      color: Colors.transparent,
                      child: GestureDetector(
                        onTap: () {
                          HapticFeedback.lightImpact();
                          setState(() {
                            _items.removeAt(item.key);
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.redAccent.withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close_rounded,
                            size: 16,
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          if (_items.length < _maxItems)
            addNewItem()
          else
            MaxItemLimit(message: ' وصلت للحد الأقصى — ٤ عناصر ✓'),

          SizedBox(height: 16),

          SendButton(
            enabled: titleCtrl.text.trim().isNotEmpty && _items.isNotEmpty,
            type: WidgetType.checklist,
            onTap: () {
              widget.onSend({'title': titleCtrl.text.trim(), 'items': _items});
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Row addNewItem() {
    return Row(
      children: [
        Expanded(
          child: NeuInput(
            ctrl: _itemCtrl,
            hint:
                'أضف عنصر جديد ... حد أقصى ${_maxItems - _items.length} عناصر 4',
            onSubmit: _addItem,
          ),
        ),
        const SizedBox(width: 8),

        ElevatedButton(
          onPressed: _addItem,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'إضافة',
            style: TextStyles.bold13.copyWith(
              color: AppColors.lightseconderyColor,
            ),
          ),
        ),
      ],
    );
  }
}
