import 'package:flutter/material.dart';
import 'package:mini_robo/core/app_colors.dart';
import 'package:mini_robo/shared/custom_blue.dart';
import 'package:mini_robo/shared/custom_bottom_navigation.dart';
import 'package:mini_robo/shared/custome_second_text.dart';
import 'package:mini_robo/shared/custom_title.dart';

class CameraModesScreen extends StatefulWidget {
  const CameraModesScreen({super.key});

  @override
  State<CameraModesScreen> createState() => _CameraModesScreenState();
}

class _CameraModesScreenState extends State<CameraModesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(10.0, 60.0, 0.0, 0),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavigationCustom(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 40,
                      color: AppColors.icons,
                    ),
                  ),

                  SizedBox(width: 10),
                  CustomTitle(),
                ],
              ),

              const SizedBox(height: 174.0),

              const SecondCustomeText(
                text: 'Which mode do you \n  want to try today?',
                fontSize: 29.0,
              ),

              const SizedBox(height: 32.0),

              Row(
                children: [
                  BlueCustom(
                    text: "Detection",
                    fontSize: 22.0,
                    width: 120.0,
                    height: 60.0,
                    font_color: Color(0xffEBEBEB),
                  ),
                  BlueCustom(
                    text: "Detection",
                    fontSize: 22.0,
                    width: 120.0,
                    height: 60.0,
                    font_color: Color(0xffEBEBEB),
                  ),
                ],
              ),

              const SizedBox(height: 87.0),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
