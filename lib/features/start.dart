import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mini_robo/core/app_colors.dart';
import 'package:mini_robo/features/home/home.dart';
import 'package:mini_robo/features/movement/movement.dart';
import 'package:mini_robo/shared/bottom_navigation_custom.dart';
import 'package:mini_robo/shared/buttons/button_custom.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Colors.blueAccent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xFFFFFFFF), Color(0xFFB3D1F2), Color(0xFF86B4E5)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/robot_happy.png'),
            ButtonCustom(
              text: 'let’s go',
              fontSize: 32,
              isimage: false,
              backColor: AppColors.secondaryColor,
             onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>   Home()), // اتأكد إن اسم الكلاس Home
    );
  },
            ),
          ],
        ),
      ),
    );
  }
}
