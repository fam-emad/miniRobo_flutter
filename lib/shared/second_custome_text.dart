import 'package:flutter/material.dart';
import 'package:mini_robo/core/app_colors.dart';

class SecondCustomeText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color? font_color;
  final bool isBlack;
  const SecondCustomeText({
    super.key,
    required this.text,
    required this.fontSize,
    this.isBlack = true, this.font_color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'inter',
        fontWeight: FontWeight.w900,
        fontSize: fontSize,
        color: font_color   ?? AppColors.textColor ,
      ),
    );
  }
}
