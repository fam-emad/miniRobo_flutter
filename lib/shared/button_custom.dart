import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mini_robo/core/app_colors.dart';
import 'package:mini_robo/shared/black_custome_text.dart';

class ButtonCustom extends StatefulWidget {
  final String text;
  final double fontSize;
  final IconData icon;
  final bool isSelected;
  const ButtonCustom({
    super.key,
    required this.text,
    required this.fontSize,
    required this.icon,
    this.isSelected = false,
  });

  @override
  State<ButtonCustom> createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(40),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
        child: Container(
          padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
          width: 350,
          height: 97,
          decoration: BoxDecoration(
            color: AppColors.textColor2.withValues(alpha: 0.8),
            borderRadius: BorderRadiusGeometry.circular(40),
            border: Border.all(
              color: AppColors.textColor2.withValues(alpha: 1),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(114, 0, 0, 0).withValues(alpha: 0.5),
                blurRadius: 150,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              BlackCustomeText(text: widget.text, fontSize: widget.fontSize),
              Image(
                image: AssetImage("assets/images/Treble Clef.png"),
                width: 48,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
