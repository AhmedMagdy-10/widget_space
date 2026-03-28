import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widget_space/core/utils/app_colors.dart';

class SkeuomorphicChatInput extends StatefulWidget {
  final Function(String) onSend;
  final VoidCallback onPlusTap;

  const SkeuomorphicChatInput({
    super.key,
    required this.onSend,
    required this.onPlusTap,
  });

  @override
  State<SkeuomorphicChatInput> createState() => _SkeuomorphicChatInputState();
}

class _SkeuomorphicChatInputState extends State<SkeuomorphicChatInput> {
  final TextEditingController _controller = TextEditingController();
  bool _hasText = false;

  // الثوابت التصميمية
  static const Color _bgColor = Color(0xFF1C1C1C);
  static const Color _accentColor = Color(0xFF6C63FF);
  static const int _charLimit = 100;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    if (mounted) {
      setState(() {
        _hasText = _controller.text.trim().isNotEmpty;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: _buildMainOuterDecoration(),
      child: SafeArea(
        child: Row(
          crossAxisAlignment:
              CrossAxisAlignment.end, // لضمان بقاء الأزرار في الأسفل عند التوسع
          children: [
            // 1. زر الإضافة (+)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: _buildPlusButton(),
            ),

            const SizedBox(width: 12),

            // 2. حقل الإدخال المحفور والمتوسع
            Expanded(child: _buildInputFieldContainer()),

            const SizedBox(width: 12),

            // 3. زر الإرسال
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: _buildSendButton(),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildMainOuterDecoration() {
    return BoxDecoration(
      color: _bgColor,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.4),
          offset: const Offset(0, -4),
          blurRadius: 12,
        ),
      ],
    );
  }

  Widget _buildPlusButton() {
    return _SkeuoButton(
      onTap: widget.onPlusTap,
      icon: Icons.add_rounded,
      color: _bgColor,
      iconColor: _accentColor,
    );
  }

  Widget _buildInputFieldContainer() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: _bgColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            offset: const Offset(3, 3),
            blurRadius: 4,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.05),
            offset: const Offset(-3, -3),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [_buildTextFormField(), _buildCharCounter()],
      ),
    );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      controller: _controller,
      maxLines: null,
      minLines: 1,
      maxLength: _charLimit,
      keyboardType: TextInputType.multiline,

      style: GoogleFonts.tajawal(
        color: Colors.white70,
        fontSize: 14,
        height: 1.4,
      ),
      decoration: InputDecoration(
        hintText: 'اكتب شيئاً جميلاً...',
        hintStyle: GoogleFonts.tajawal(
          color: Colors.grey.shade500,
          fontSize: 13,
        ),
        border: InputBorder.none,
        isDense: true,
        counterText: "", // إخفاء العداد الافتراضي
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
      ),
    );
  }

  Widget _buildCharCounter() {
    int currentLength = _controller.text.length;
    bool isNearLimit = currentLength >= (_charLimit - 15);

    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Text(
        "$currentLength / $_charLimit",
        style: GoogleFonts.poppins(
          fontSize: 9,
          color: isNearLimit ? Colors.orangeAccent : Colors.grey.shade400,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSendButton() {
    return _SkeuoButton(
      onTap: () {
        if (_hasText) {
          widget.onSend(_controller.text.trim());
          _controller.clear();
        }
      },
      icon: Icons.send_rounded,
      color: _accentColor,
      iconColor: Colors.white,
      isEnabled: _hasText,
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }
}

class _SkeuoButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color color;
  final Color iconColor;
  final bool isEnabled;

  const _SkeuoButton({
    required this.onTap,
    required this.icon,
    required this.color,
    required this.iconColor,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: isEnabled ? 1.0 : 0.4,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(4, 4),
                blurRadius: 8,
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.08),
                offset: const Offset(-2, -2),
                blurRadius: 6,
              ),
            ],
          ),
          child: Icon(icon, color: iconColor, size: 20),
        ),
      ),
    );
  }
}
