import 'package:flutter/material.dart';
import 'package:mini_robo/core/app_colors.dart';
import 'package:mini_robo/shared/buttons/custom_navigation_bottom.dart';
import 'package:mini_robo/shared/buttons/custom_button.dart';

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
            CustomButton(
              text: 'let’s go',
              fontSize: 32,
              isImage: false,
              backColor: AppColors.secondaryColor,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavigationCustom(),
                  ),
                );
              },
              width: 310,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
