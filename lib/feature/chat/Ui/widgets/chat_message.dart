import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widget_space/core/utils/app_colors.dart';

class SkeuoChatBubble extends StatelessWidget {
  final String message;
  final String time;
  final bool isMe;

  const SkeuoChatBubble({
    super.key,
    required this.message,
    required this.time,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isMe
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: const EdgeInsets.all(16),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            decoration: isMe
                ? _buildSentDecoration()
                : _buildReceivedDecoration(),
            child: Text(
              message,
              style: GoogleFonts.tajawal(
                color: isMe ? Colors.white : AppColors.seconderyColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
          ),
          // الوقت وحالة القراءة
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  time,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: AppColors.seconderyColor.withOpacity(0.6),
                  ),
                ),
                if (isMe) ...[
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.done_all_rounded,
                    size: 14,
                    color: AppColors.lightseconderyColor,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- تصميم الرسالة المرسلة (Barz/Elevated Purple) ---
  BoxDecoration _buildSentDecoration() {
    return BoxDecoration(
      color: AppColors.lightseconderyColor, // البنفسجي المميز
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(4),
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.lightseconderyColor.withOpacity(0.4),
          offset: const Offset(4, 4),
          blurRadius: 10,
        ),
        BoxShadow(
          color: AppColors.shadowLight.withOpacity(0.2),
          offset: const Offset(-2, -2),
          blurRadius: 5,
        ),
      ],
    );
  }

  // --- تصميم الرسالة المستقبلة (Classic Neumorphic Soft UI) ---
  BoxDecoration _buildReceivedDecoration() {
    return BoxDecoration(
      color: AppColors.primaryColor, // نفس لون خلفية التطبيق
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
        bottomLeft: Radius.circular(4),
      ),
      boxShadow: [
        // الظل الغامق للأسفل واليمين
        const BoxShadow(
          color: AppColors.shadowDark,
          offset: Offset(4, 4),
          blurRadius: 8,
        ),
        // الظل الفاتح للأعلى واليسار (تأثير الضوء)
        const BoxShadow(
          color: AppColors.shadowLight,
          offset: Offset(-4, -4),
          blurRadius: 8,
        ),
      ],
    );
  }
}
