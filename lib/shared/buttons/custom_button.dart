import 'package:flutter/material.dart';
import 'package:mini_robo/core/app_colors.dart';
import 'package:mini_robo/shared/texts/custom_text.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final double fontSize;
  final double width;
  final double height;
  final Color? fontColor;
  final Color? backColor;
  final VoidCallback onTap;
  final bool isActive;
  final bool? isImage;
  final IconData? icon;
  final double? iconsize;
  final Color? iconcolor;
  const CustomButton({
    super.key,
    required this.text,
    required this.fontSize,
    this.backColor,
    required this.width,
    required this.height,
    this.fontColor,
    this.isImage = false,
    required this.onTap,
    this.isActive = false,
    this.icon,
    this.iconsize,    
    this.iconcolor,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color:
            widget.backColor ??
            (widget.isActive
                ? AppColors.primaryColor.withValues(alpha: 0.45)
                : AppColors.primaryColor),

        borderRadius: BorderRadiusGeometry.circular(50),
        border: Border.all(
          color: widget.isActive
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
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: widget.text,
              fontSize: widget.fontSize,
              fontColor: widget.fontColor ?? AppColors.textColor2,
            ),
            widget.isImage ?? true
                ? Image(
                    image: AssetImage("assets/images/Treble Clef.png"),
                    width: 48,
                    fit: BoxFit.contain,
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
