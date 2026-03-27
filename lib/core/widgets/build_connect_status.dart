import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildConnectStatus extends StatelessWidget {
  const BuildConnectStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
      decoration: BoxDecoration(
        color: const Color(0xFF2ED573).withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFF2ED573),
                  shape: BoxShape.circle,
                ),
              )
              .animate(onPlay: (c) => c.repeat())
              .scale(begin: const Offset(0.7, 0.7), end: const Offset(1.4, 1.4))
              .then()
              .fadeOut(),
          const SizedBox(width: 6),
          Text(
            'دائما في انتظارك',
            style: GoogleFonts.tajawal(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF1B9E54),
            ),
          ),
        ],
      ),
    );
  }
}
