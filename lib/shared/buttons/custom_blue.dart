import 'package:flutter/material.dart';
import 'package:mini_robo/shared/texts/custome_second_text.dart';

class BlueCustom extends StatefulWidget {
  final String text;
  final double fontSize;
  final double width;
  final double height;
  final Color? font_color;
  const BlueCustom({
    super.key,
    required this.text,
    required this.fontSize,
    required this.width,
    required this.height,
    this.font_color,
  });

  @override
  State<BlueCustom> createState() => _BlueCustomState();
}

class _BlueCustomState extends State<BlueCustom> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: Color(0xFF86B4E5),
          borderRadius: BorderRadiusGeometry.circular(50),
          border: Border.all(
            color: Color(0xFF86B4E5).withValues(alpha: 1),
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
        child: SecondCustomeText(
          text: widget.text,
          fontSize: widget.fontSize,
          fontColor: widget.font_color ?? Colors.white,
        ),
      ),
    );
  }
}
