import 'package:flutter/material.dart';
import 'package:mini_robo/core/app_colors.dart';

class SecondCustomeText extends StatelessWidget {
  final String text;
  final double fontSize;
  final bool isBlack;
  const SecondCustomeText({
    super.key,
    required this.text,
    required this.fontSize,
    this.isBlack = true,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'inter',
        fontWeight: FontWeight.w900,
        fontSize: fontSize,
        color: isBlack ? AppColors.textColor : AppColors.secondaryColor,
      ),
    );
  }
}
