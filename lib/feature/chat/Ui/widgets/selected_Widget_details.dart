import 'package:flutter/material.dart';
import 'package:widget_space/core/helper/widgets_type.dart';
import 'package:widget_space/feature/chat/Ui/widgets/check_list_widget.dart/check_list_composer.dart';
import 'package:widget_space/feature/chat/Ui/widgets/limited_banner_widget.dart';
import 'package:widget_space/feature/chat/Ui/widgets/selected_widget_header.dart';
import 'package:widget_space/feature/chat/Ui/widgets/sticky_note_widget/sticky_note_composer.dart';

class SelectedWidgetDetails extends StatelessWidget {
  const SelectedWidgetDetails({
    super.key,
    required this.type,
    required this.onSend,
  });
  final WidgetType type;
  final void Function(Map<String, dynamic>) onSend;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: 24,
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SelectedWidgetHeader(type: type),
            SizedBox(height: 20),

            LimitedBanner(type: type),

            buildWidgetPreview(),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildWidgetPreview() {
    switch (type) {
      case WidgetType.stickyNote:
        return StickyNoteComposer(onSend: onSend);
      case WidgetType.checklist:
        return CheckListComposer(onSend: onSend);
      case WidgetType.zikr:
        return ElevatedButton(onPressed: () {}, child: Text('مثال زر'));
      case WidgetType.moment:
        return Container(
          width: 100,
          height: 100,
          color: Colors.grey,
          child: Icon(Icons.image, color: Colors.white),
        );
      default:
        return Container();
    }
  }
}
