import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:widget_space/core/utils/app_colors.dart';
import 'package:widget_space/core/widgets/custom_icons_shape.dart';
import 'package:widget_space/feature/home/Ui/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = '_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: [
                Row(
                  children: [
                    const Text(
                      '✦ ',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.lightseconderyColor,
                      ),
                    ),

                    const Text(
                      'Ahmed Magdy',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset('assets/images/apple_icon.svg'),
                ),
              ],
            ),
          ),
        ],

        title: CustomIconShape(icon: Icons.notifications_active, onTap: () {}),
      ),
      body: HomeViewBody(),
    );
  }
}
