import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mini_robo/core/app_colors.dart'; 

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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 250,
        height: height ?? 97,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),

        decoration: BoxDecoration(
          color: ccolor ?? Colors.white,
          borderRadius: BorderRadius.circular(radius ?? 20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SecondCustomeText(
            //   text: text,
            //   fontSize: fontSize,
            //   fontColor: AppColors.secondaryColor,
            // ),
            Gap(8),
            isimage
                ? Icon(
                    icon,
                    size: iconsize ?? 50,
                    color: iconcolor ?? AppColors.icons,
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
