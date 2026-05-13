import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:widget_space/core/helper/widgets_type.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/core/utils/app_text_styles.dart';
import 'package:widget_space/core/utils/box_shadow.dart';
import 'package:widget_space/core/widgets/field_label.dart';
import 'package:widget_space/core/widgets/max_item_limit.dart';
import 'package:widget_space/feature/chat/Ui/widgets/check_list_widget.dart/check_list_address_input_field.dart';
import 'package:widget_space/feature/chat/Ui/widgets/widget_send_button.dart';

class ZikrWidgetComposer extends StatefulWidget {
  const ZikrWidgetComposer({super.key, required this.onSend});
  final void Function(Map<String, dynamic>) onSend;

  @override
  State<ZikrWidgetComposer> createState() => _ZikrWidgetComposerState();
}

class _ZikrWidgetComposerState extends State<ZikrWidgetComposer> {
  final TextEditingController _itemCtrl = TextEditingController();
  final List<String> azkar = [
    'سبحان الله وبحمده',
    'الحمد لله',
    'لا اله الا الله',
    'اللَّه أكبر',
  ];
  int _selected = 0;
  final int _maxItems = 6;

  void _addItem() {
    final val = _itemCtrl.text.trim();
    if (val.isEmpty || azkar.length >= _maxItems) return;
    HapticFeedback.lightImpact();
    setState(() {
      azkar.add(val);
      _itemCtrl.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldLabel(label: ' اختر الذكر :  كون السبب في ذكر الله 🌿'),
        ...azkar.asMap().entries.map((e) {
          final bool isSelected = e.key == _selected;

          String zikr = e.value;
          return GestureDetector(
            onTap: () {
              setState(() => _selected = e.key);
              HapticFeedback.selectionClick();
            },

            child: AnimatedContainer(
              duration: 180.ms,
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.fromLTRB(13, 11, 13, 11),
              decoration: BoxDecoration(
                gradient: isSelected
                    ? const LinearGradient(
                        colors: [Color(0xFFE4F0D8), Color(0xFFD8ECCA)],
                      )
                    : null,

                color: isSelected ? null : AppColors.primaryColor,
                borderRadius: BorderRadius.circular(14),
                boxShadow: isSelected
                    ? BoxShadowUtils.inset
                    : BoxShadowUtils.raised,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          zikr,
                          textDirection: TextDirection.rtl,
                          style: TextStyles.bold16.copyWith(
                            color: Color(0xFF1A5A2A),
                          ),
                        ),
                      ],
                    ),
                  ),

                  if (isSelected)
                    const Icon(Icons.check_circle, color: Color(0xFF1A5A2A)),

                  if (!isSelected)
                    const Text('🌿', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          );
        }),

        if (azkar.length < _maxItems)
          addNewZikr()
        else
          MaxItemLimit(message: 'يمكنك إضافة حتى $_maxItems أذكار فقط.'),
        SizedBox(height: 16),

        SendButton(
          enabled: _itemCtrl.text.trim().isNotEmpty && azkar.isNotEmpty,
          type: WidgetType.zikr,
          onTap: () {
            widget.onSend({'title': _itemCtrl.text.trim(), 'items': azkar});
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Row addNewZikr() {
    return Row(
      children: [
        Expanded(
          child: NeuInput(
            ctrl: _itemCtrl,
            hint: 'أضف ذكر خاص بك (اختياري) 🌿',
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
