import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/feature/home/logic/manager/main_cubit.dart';
import 'package:widget_space/feature/home/logic/manager/main_cubit_states.dart';

class BottomBarCustom extends StatelessWidget {
  const BottomBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    // لون الخلفية المناسب للـ Skeuomorphism الداكن
    const Color baseColor = Color(0xFF1C1C1C);

    return BlocBuilder<MainCubit, MainCubitStates>(
      // لضمان تحديث الألوان عند تغيير الصفحة
      builder: (context, state) {
        int currentIndex = BlocProvider.of<MainCubit>(context).currentIndexPage;

        return Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 30),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          decoration: BoxDecoration(
            color: baseColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              // ظل خارجي كبير لبروز الـ Bar بالكامل
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(10, 10),
                blurRadius: 20,
              ),
              BoxShadow(
                color: Colors.white.withOpacity(0.05),
                offset: const Offset(-5, -5),
                blurRadius: 15,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSkeuoItem(
                context,
                0,
                Icons.house,
                "الرئيسية",
                currentIndex,
              ),
              _buildSkeuoItem(
                context,
                1,
                Icons.chat_bubble_outline,
                "الدردشة",
                currentIndex,
              ),
              _buildSkeuoItem(
                context,
                2,
                Icons.palette_outlined,
                "ويدجتاتي",
                currentIndex,
              ),
              _buildSkeuoItem(
                context,
                3,
                Icons.person_outline,
                "حسابي",
                currentIndex,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSkeuoItem(
    BuildContext context,
    int index,
    IconData icon,
    String label,
    int currentIndex,
  ) {
    bool isSelected = currentIndex == index;
    const Color baseColor = Color(0xFF1C1C1C);

    return GestureDetector(
      onTap: () => BlocProvider.of<MainCubit>(context).changePage(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: baseColor,
              shape: BoxShape.circle,
              boxShadow: isSelected
                  ? [
                      // تأثير الزر "المضغوط للداخل" (الغائر)
                      BoxShadow(
                        offset: const Offset(4, 4),
                        blurRadius: 4,
                        color: Colors.black.withOpacity(0.8),
                      ),
                      BoxShadow(
                        offset: const Offset(-4, -4),
                        blurRadius: 4,
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ]
                  : [
                      // تأثير الزر "البارز" (الطبيعي)
                      BoxShadow(
                        offset: const Offset(4, 4),
                        blurRadius: 8,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      BoxShadow(
                        offset: const Offset(-4, -4),
                        blurRadius: 8,
                        color: Colors.white.withOpacity(0.05),
                      ),
                    ],
            ),
            child: Icon(
              icon,
              size: 20,
              color: isSelected
                  ? AppColors.lightseconderyColor
                  : Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isSelected ? Colors.white : Colors.grey.shade500,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
