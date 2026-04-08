import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mini_robo/core/app_colors.dart';

class CustomGlassBox extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color? backColor;
   final Color? font_color;
     final double? height;
     final double? width;
     final double? iconsize;
   final Color? iconcolor;

  const CustomGlassBox({super.key, required this.text, required this.icon, this.backColor, this.font_color, this.height, this.width, this.iconcolor, this.iconsize});

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
            width:width?? 141,
            height:height?? 126,
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
               
              color:backColor?? Colors.white.withValues(alpha: 0.3),
              borderRadius: BorderRadiusGeometry.circular(40),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.3),
                width: 1.5,
              ),
            ),
            child: Column(
              children: [
                Icon(icon, size:iconsize?? 50, color: iconcolor??AppColors.icons),
                Gap(5),
                Text(
                  text,
                  style: TextStyle(
                    fontFamily: 'inter',
                    fontWeight: FontWeight.w900,
                    fontSize: 23,
                    color: font_color?? AppColors.textColor2,
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
