import 'package:flutter/material.dart';
import 'package:widget_space/core/helper/widgets_type.dart';
import 'package:widget_space/core/widgets/field_label.dart';
import 'package:widget_space/core/widgets/limit_porgress_bar.dart';
import 'package:widget_space/feature/chat/Ui/widgets/sticky_note_widget/sticky_main_screen_perview.dart';
import 'package:widget_space/feature/chat/Ui/widgets/sticky_note_widget/text_note_area.dart';
import 'package:widget_space/feature/chat/Ui/widgets/widget_send_button.dart';

class StickyNoteComposer extends StatefulWidget {
  const StickyNoteComposer({super.key, required this.onSend});

  final void Function(Map<String, dynamic>) onSend;

  @override
  State<StickyNoteComposer> createState() => _StickyNoteComposerState();
}

class _StickyNoteComposerState extends State<StickyNoteComposer> {
  final TextEditingController _ctrl = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  static const _maxChars = 80;
  static const _maxWords = 20;

  int get _charCount => _ctrl.text.length;
  int get _wordCount => _ctrl.text.trim().isEmpty
      ? 0
      : _ctrl.text.trim().split(RegExp(r'\s+')).length;

  bool get _isOver => _charCount > _maxChars || _wordCount > _maxWords;
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _scrollToBottom();
      }
    });
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          StickyMainScreenPerview(ctrl: _ctrl),

          FieldLabel(label: 'محتوى الملاحظة ✏️'),

          TextNoteArea(
            controller: _ctrl,
            hint: 'اكتب ملاحظتك هنا... 20 كلمة كحد أقصى',
            maxLines: 4,
            onChanged: (_) => setState(() {}),
          ),
          SizedBox(height: 16),
          LimitProgressBar(
            current: _charCount,
            max: _maxChars,
            isOver: _isOver,
            label: '$_charCount/$_maxChars',
          ),
          SizedBox(height: 16),

          SendButton(
            type: WidgetType.stickyNote,
            enabled: !_isOver && _charCount > 0,
            onTap: () {
              widget.onSend({
                'type': 'stickyNote',
                'content': _ctrl.text.trim(),
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
