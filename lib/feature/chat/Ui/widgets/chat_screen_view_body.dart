import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widget_space/core/widgets/custom_icons_shape.dart';
import 'package:widget_space/feature/chat/Ui/widgets/custom_text_input_field.dart';
import 'package:widget_space/feature/chat/Ui/widgets/date_divider.dart';
import 'package:widget_space/feature/chat/Ui/widgets/user_connect_status_header.dart';

class ChatScreenViewBody extends StatelessWidget {
  const ChatScreenViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                UserConnectStatusHeader(),
                CustomIconShape(
                  icon: Icons.arrow_forward_ios_outlined,

                  onTap: () {},
                ),
              ],
            ),
          ),

          Divider(color: Colors.white),

          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 16, right: 16),
            child: DateDivider(label: 'اليوم'),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SkeuomorphicChatInput(onSend: (b) {}, onPlusTap: () {}),
          ),
        ],
      ),
    );
  }
}
