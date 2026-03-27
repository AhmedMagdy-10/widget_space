import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:widget_space/core/utils/app_colors.dart';

List<BoxShadow> neuRaised({double d = 6, double b = 14}) => [
  BoxShadow(color: AppColors.shadowDark, offset: Offset(d, d), blurRadius: b),
  BoxShadow(
    color: AppColors.shadowLight,
    offset: Offset(-d, -d),
    blurRadius: b,
  ),
];

class TaglineBanner extends StatelessWidget {
  const TaglineBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFE8ECF4), Color(0xFFDDE3EE), Color(0xFFD8DFE9)],
          ),
          borderRadius: BorderRadius.circular(22),
          boxShadow: neuRaised(d: 8, b: 18),
        ),
        child: Stack(
          children: [
            // ── Glass shine top
            const _GlassShine(),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Label Row
                const _LabelRow().animate().fadeIn(duration: 400.ms),

                const SizedBox(height: 12),

                // ── Main Tagline
                const _MainTagline()
                    .animate(delay: 100.ms)
                    .fadeIn(duration: 450.ms)
                    .slideY(begin: 0.15, curve: Curves.easeOut),

                const SizedBox(height: 8),

                // ── Sub line
                const _SubTagline()
                    .animate(delay: 200.ms)
                    .fadeIn(duration: 400.ms),

                const SizedBox(height: 14),

                // ── Pills
                const _PillsRow()
                    .animate(delay: 320.ms)
                    .fadeIn(duration: 400.ms)
                    .slideY(begin: 0.1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  GLASS SHINE
// ─────────────────────────────────────────────
class _GlassShine extends StatelessWidget {
  const _GlassShine();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(22)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white.withOpacity(0.45),
              Colors.white.withOpacity(0.0),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  LABEL ROW  — "WidgetChat ✦"
// ─────────────────────────────────────────────
class _LabelRow extends StatelessWidget {
  const _LabelRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Gradient text
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF8880C8), AppColors.lightseconderyColor],
          ).createShader(bounds),
          child: const Text(
            'WidgetChat ✦',
            style: TextStyle(
              fontFamily: 'Cairo',
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
              color: Colors.white, // masked by shader
            ),
          ),
        ),

        const SizedBox(width: 8),

        // Line after label
        Expanded(
          child: Container(
            height: 1,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0x666C63FF), // accent 40%
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
//  MAIN TAGLINE — "تواصَل بما لا تستطيع الكلمات قوله"
// ─────────────────────────────────────────────
class _MainTagline extends StatefulWidget {
  const _MainTagline();

  @override
  State<_MainTagline> createState() => _MainTaglineState();
}

class _MainTaglineState extends State<_MainTagline>
    with SingleTickerProviderStateMixin {
  late final AnimationController _lineCtrl;
  late final Animation<double> _lineAnim;

  @override
  void initState() {
    super.initState();
    _lineCtrl = AnimationController(vsync: this, duration: 900.ms);
    _lineAnim = CurvedAnimation(parent: _lineCtrl, curve: Curves.easeOut);
    // تبدأ animation الخط بعد ظهور النص
    Future.delayed(600.ms, () {
      if (mounted) _lineCtrl.forward();
    });
  }

  @override
  void dispose() {
    _lineCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontFamily: 'Cairo',
          fontSize: 21,
          fontWeight: FontWeight.w800,
          color: Color(0xFF3D4A5C),
          height: 1.45,
          letterSpacing: -0.3,
          shadows: [
            Shadow(color: Colors.white, offset: Offset(1, 1), blurRadius: 0),
          ],
        ),
        children: [
          const TextSpan(text: 'تواصَل بما لا تستطيع\n'),
          // "الكلمات" مع underline animation
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: AnimatedBuilder(
              animation: _lineAnim,
              builder: (_, __) => CustomPaint(
                painter: _UnderlinePainter(progress: _lineAnim.value),
                child: const Text(
                  'الكلمات',
                  style: TextStyle(
                    fontFamily: 'Cairo',
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                    color: AppColors.lightseconderyColor,
                    height: 1.45,
                    shadows: [
                      Shadow(
                        color: Color(0x406C63FF),
                        offset: Offset(0, 2),
                        blurRadius: 8,
                      ),
                      Shadow(
                        color: Colors.white,
                        offset: Offset(1, 1),
                        blurRadius: 0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const TextSpan(text: ' قوله'),
        ],
      ),
    );
  }
}

// Underline painter
class _UnderlinePainter extends CustomPainter {
  final double progress;
  const _UnderlinePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    if (progress == 0) return;
    final paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..shader = LinearGradient(
        colors: [
          Colors.transparent,
          AppColors.lightseconderyColor,
          AppColors.lightseconderyColor,
          Colors.transparent,
        ],
        stops: const [0.0, 0.2, 0.8, 1.0],
      ).createShader(Rect.fromLTWH(0, size.height + 2, size.width, 2));

    canvas.drawLine(
      Offset(0, size.height + 2),
      Offset(size.width * progress, size.height + 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(_UnderlinePainter old) => old.progress != progress;
}

// ─────────────────────────────────────────────
//  SUB TAGLINE — "لأن بعض المشاعر أكبر من كلمة"
// ─────────────────────────────────────────────
class _SubTagline extends StatelessWidget {
  const _SubTagline();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          fontFamily: 'Tajawal',
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: AppColors.seconderyColor,
          height: 1.65,
        ),
        children: [
          TextSpan(text: 'لأن بعض المشاعر '),
          TextSpan(
            text: 'أكبر من كلمة',
            style: TextStyle(
              color: Color(0xFF9590D8),
              fontWeight: FontWeight.w600,
              shadows: [
                Shadow(
                  color: Color(0x259590D8),
                  offset: Offset(0, 1),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  PILLS ROW
// ─────────────────────────────────────────────
class _PillsRow extends StatelessWidget {
  const _PillsRow();

  static const _pills = [
    (label: 'ملاحظات', color: AppColors.lightseconderyColor),
    (label: 'ذكر', color: Color.fromARGB(255, 240, 99, 74)),
    (label: 'قوائم مشتركة', color: Color(0xFF2ED573)),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 7,
      runSpacing: 6,
      children: _pills
          .asMap()
          .entries
          .map(
            (e) => _NeuPill(label: e.value.label, dotColor: e.value.color)
                .animate(delay: (e.key * 70).ms)
                .fadeIn(duration: 350.ms)
                .slideX(begin: 0.2, curve: Curves.easeOut),
          )
          .toList(),
    );
  }
}

// ─────────────────────────────────────────────
//  NEU PILL
// ─────────────────────────────────────────────
class _NeuPill extends StatefulWidget {
  final String label;
  final Color dotColor;
  const _NeuPill({required this.label, required this.dotColor});

  @override
  State<_NeuPill> createState() => _NeuPillState();
}

class _NeuPillState extends State<_NeuPill> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedContainer(
        duration: 130.ms,
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: _pressed
              ? [
                  // inset — منضغط
                  BoxShadow(
                    color: AppColors.shadowDark,
                    offset: const Offset(2, 2),
                    blurRadius: 5,
                  ),
                  BoxShadow(
                    color: AppColors.shadowLight,
                    offset: const Offset(-2, -2),
                    blurRadius: 5,
                  ),
                ]
              : neuRaised(d: 3, b: 7),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Dot
            AnimatedContainer(
              duration: 200.ms,
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: widget.dotColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: widget.dotColor.withOpacity(0.4),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            // Label
            Text(
              widget.label,
              style: TextStyle(
                fontFamily: 'Tajawal',
                fontSize: 10,
                color: _pressed ? widget.dotColor : AppColors.seconderyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
