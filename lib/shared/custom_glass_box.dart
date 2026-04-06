import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mini_robo/core/app_colors.dart';

class CustomGlassBox extends StatelessWidget {
  final String text;
  final IconData icon;
  const CustomGlassBox({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(21.0, 15, 0.0, 0),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(40),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.all(16),
            width: 141,
            height: 126,
            decoration: BoxDecoration(
              // boxShadow: [
              //   BoxShadow(
              //     color: const Color.fromARGB(60, 52, 52, 52),
              //     offset: const Offset(0, 20),
              //     blurRadius: 60.0,
              //     spreadRadius: 15.0,
              //     blurStyle: BlurStyle.normal,
              //   ),
              // ],
              color: Colors.white.withValues(alpha: 0.3),
              borderRadius: BorderRadiusGeometry.circular(40),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.3),
                width: 1.5,
              ),
            ),
            child: Column(
              children: [
                Icon(icon, size: 45, color: AppColors.icons),
                Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'inter',
                    fontWeight: FontWeight.w900,
                    fontSize: 28,
                    color: AppColors.textColor2,
                    shadows: [
                      Shadow(
                        color: Color.fromARGB(209, 154, 154, 154),
                        offset: const Offset(0, 0),
                        blurRadius: 7,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
