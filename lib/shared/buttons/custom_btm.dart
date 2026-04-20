import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mini_robo/core/utils/app_colors.dart';

class CustomBtm extends StatelessWidget {
  const CustomBtm({
    super.key,
    required this.text,
    this.onTap,
    this.ccolor,
    this.colorfont,
    required this.fontSize,
    required this.isimage,
    this.iconsize,
    this.iconcolor,
    this.icon,
    this.height,
    this.width,
    this.radius,
  });
  final String text;
  final Function()? onTap;
  final Color? ccolor;
  final Color? colorfont;
  final double? iconsize;
  final Color? iconcolor;
  final IconData? icon;
  final double fontSize;
  final double? height;
  final double? width;
  final double? radius;

  final bool isimage;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        // Responsive defaults: 60% of screen width and 12% of height
        width: width ?? screenSize.width * 0.6,
        height: height ?? screenSize.height * 0.12,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        decoration: BoxDecoration(
          color: ccolor ?? Colors.white,
          borderRadius: BorderRadius.circular(radius ?? 20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Your commented text code...
            const Gap(8),
            isimage
                ? Icon(
                    icon,
                    size: iconsize ?? (screenSize.width * 0.12), // Scaled icon
                    color: iconcolor ?? AppColors.icons,
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
