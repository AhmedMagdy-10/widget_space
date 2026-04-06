import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:widget_space/core/helper/widgets_type.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/feature/chat/Ui/widgets/limited_banner_widget.dart';
import 'package:widget_space/feature/chat/Ui/widgets/selected_widget_header.dart';
import 'package:widget_space/feature/chat/Ui/widgets/sticky_note_composer.dart';

Future<void> selectedWidgetBottomSheet({
  required BuildContext context,
  required WidgetType selectedType,
  required void Function(Map<String, dynamic>) onSend,
}) {
  return showBarModalBottomSheet(
    context: context,
    isDismissible: false,
    barrierColor: Colors.black45,
    enableDrag: true,
    expand: false,
    duration: const Duration(milliseconds: 500),
    backgroundColor: AppColors.primaryColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    animationCurve: Curves.easeInOutQuart,
    elevation: 0,
    bounce: true,
    builder: (context) {
      return SelectedWidgetDetails(type: selectedType, onSend: onSend);
    },
  );
}

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
    return Padding(
      padding: EdgeInsets.only(
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
      ),
      child: SingleChildScrollView(
        reverse: true,
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
      case WidgetType.zikr:
        return ElevatedButton(onPressed: () {}, child: Text('مثال زر'));
      case WidgetType.stickyNote:
        return StickyNoteComposer(onSend: onSend);
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
