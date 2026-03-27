import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:widget_space/core/utils/app_text_styles.dart';
import 'package:widget_space/core/widgets/build_connect_status.dart';

class UserConnectStatusHeader extends StatelessWidget {
  const UserConnectStatusHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: SvgPicture.asset('assets/images/apple_icon.svg'),
        ),
        SizedBox(width: 10),
        Column(
          children: [
            const Text(
              'Ahmed Magdy',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.bold19,
            ),
            BuildConnectStatus(),
          ],
        ),
      ],
    );
  }
}
