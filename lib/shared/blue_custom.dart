import 'package:flutter/material.dart';

class BlueCustom extends StatefulWidget {
  const BlueCustom({super.key});

  @override
  State<BlueCustom> createState() => _BlueCustomState();
}

class _BlueCustomState extends State<BlueCustom> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: (){}, 
    child: Container(
      width: 350,
      height: 97,
      decoration: BoxDecoration(
        color: Color(0xFF86B4E5),
        borderRadius: BorderRadiusGeometry.circular(40),
        border: Border.all(
          color: Color(0xFF86B4E5).withValues(alpha: 1),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(114, 120,120, 120).withValues(alpha: 0.5),
            blurRadius: 150,
            offset: Offset(0, 5),
          ),
        ],
      ),
    ),);
  }
}