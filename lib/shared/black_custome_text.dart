import 'package:flutter/material.dart';
import 'package:mini_robo/core/app_colors.dart';

class BlackCustomeText extends StatelessWidget {
  final String text;
  final double fontSize;
  const BlackCustomeText({
    super.key,
    required this.text,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'inter',
        fontWeight: FontWeight.w900,
        fontSize: fontSize,
        color: AppColors.textColor,
      ),
    );
  }
}
