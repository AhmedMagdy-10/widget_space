import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widget_space/core/utils/app_text_styles.dart';
import 'package:widget_space/core/widgets/build_connect_status.dart';

class EliteUserProfileHeader extends StatelessWidget {
  const EliteUserProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // تعريف لوحة الألوان (Designer Palette)
    const Color accentColor = Color(0xFF6C63FF); // البنفسجي
    const Color orangeColor = Color(0xFFFF9100); // لون النار
    const Color darkColor = Color(0xFF3D4A5C); // الرمادي الداكن للنصوص
    const Color bgCard = Color(0xFFFDF6E3); // لون خلفية كريمي دافئ

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: bgCard,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: darkColor.withOpacity(0.05),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: Stack(
          children: [
            // تزيين خلفي ناعم (دوائر شفافة)
            Positioned(
              left: -20,
              bottom: -20,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: accentColor.withOpacity(0.03),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // --- الصف العلوي (الهوية + الستريك) ---
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // 1. الصورة الشخصية
                      _buildEliteAvatar(accentColor),

                      // 2. الـ Streak Badge (بجانب الصورة في أقصى اليسار)
                      const SizedBox(width: 10),

                      // 3. الاسم والحالة (يأخذان المساحة المتبقية)
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('سارة 💙', style: TextStyles.bold19),
                            const SizedBox(height: 4),
                            BuildConnectStatus(),
                          ],
                        ),
                      ),
                      _buildFloatingStreak(orangeColor),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // --- منطقة الإحصائيات السفلى ---
                  _buildStatsGrid(darkColor, accentColor),
                ],
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.1);
  }

  // ويدجت الـ Streak العائم بتصميم رشيق ليناسب مكانه الجديد
  Widget _buildFloatingStreak(Color color) {
    return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.15),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
            border: Border.all(color: color.withOpacity(0.1), width: 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('🔥', style: TextStyles.regular16),
              const SizedBox(width: 8),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '47',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      color: color,
                      height: 1,
                    ),
                  ),
                  Text(
                    'يـــوم',
                    style: GoogleFonts.tajawal(
                      fontSize: 9,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
        .animate(onPlay: (c) => c.repeat(reverse: true))
        .moveY(begin: -2, end: 2, duration: 2.seconds, curve: Curves.easeInOut)
        .shimmer(
          delay: 3.seconds,
          duration: 2.seconds,
          color: Colors.orange.shade100,
        );
  }

  // الصورة الشخصية مع حلقة تحديد ناعمة
  Widget _buildEliteAvatar(Color color) {
    return Container(
      padding: const EdgeInsets.all(2.5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: color.withOpacity(0.2), width: 2),
      ),
      child: CircleAvatar(
        radius: 26,
        backgroundColor: color,
        child: const CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
          child: Text(
            'س',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Color(0xFF6C63FF),
            ),
          ),
        ),
      ),
    );
  }

  // حالة الاتصال (Badge) مع أنيميشن النبض

  // شبكة الإحصائيات بتصميم نظيف
  Widget _buildStatsGrid(Color dark, Color accent) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.6),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white, width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('128', 'أرسلتها', dark),
          _buildVerticalDivider(),
          _buildStatItem('94', 'استلمتها', dark),
          _buildVerticalDivider(),
          _buildStatItem('18', 'اليوم', accent),
        ],
      ),
    );
  }

  Widget _buildStatItem(String val, String label, Color color) {
    return Column(
      children: [
        Text(
          val,
          style: GoogleFonts.cairo(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: color,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.tajawal(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF707E94),
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalDivider() =>
      Container(height: 15, width: 1.2, color: Colors.grey.withOpacity(0.1));
}
