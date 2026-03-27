import 'package:flutter/material.dart';
import 'package:widget_space/core/widgets/custom_icons_shape.dart';
import 'package:widget_space/feature/chat/Ui/widgets/date_divider.dart';
import 'package:widget_space/feature/chat/Ui/widgets/user_connect_status_header.dart';

class ChatScreenViewBody extends StatelessWidget {
  const ChatScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UserConnectStatusHeader(),
                CustomIconShape(icon: Icons.arrow_forward_ios_outlined),
              ],
            ),
            DateDivider(label: 'اليوم'),
          ],
        ),
      ),
    );
  }
}
