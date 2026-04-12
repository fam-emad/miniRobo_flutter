import 'package:flutter/material.dart';
import 'package:mini_robo/core/app_colors.dart';
import 'package:mini_robo/shared/texts/custom_text.dart';

class BlueCustom extends StatelessWidget {
  final String text;
  final double fontSize;
  final double width;
  final double height;
  final Color? fontColor;
  final VoidCallback onTap;
  final bool isActive;
  const BlueCustom({
    super.key,
    required this.text,
    required this.fontSize,
    required this.width,
    required this.height,
    this.fontColor,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.primaryColor.withValues(alpha: 0.45)
            : AppColors.primaryColor,
        borderRadius: BorderRadiusGeometry.circular(50),
        border: Border.all(
          color: isActive
              ? AppColors.primaryColor.withValues(alpha: 0.45)
              : AppColors.primaryColor,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(114, 120, 120, 120).withValues(alpha: 0.2),
            blurRadius: 100,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Center(
          child: CustomText(
            text: text,
            fontSize: fontSize,
            fontColor: isActive
                ? AppColors.textColor
                : fontColor ?? AppColors.textColor2,
          ),
        ),
      ),
    );
  }
}
