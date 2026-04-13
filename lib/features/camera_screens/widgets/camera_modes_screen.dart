import 'package:flutter/material.dart';
import 'package:mini_robo/core/app_colors.dart';
import 'package:mini_robo/features/camera_screens/widgets/camera_file.dart';
import 'package:mini_robo/shared/buttons/custom_button.dart';
import 'package:mini_robo/shared/buttons/custom_modes_buttons.dart';
import 'package:mini_robo/shared/texts/custom_text.dart';
import 'package:mini_robo/shared/texts/custom_title.dart';

class CameraModesScreen extends StatefulWidget {
  const CameraModesScreen({super.key});

  @override
  State<CameraModesScreen> createState() => _CameraModesScreenState();
}

class _CameraModesScreenState extends State<CameraModesScreen> {
  String myMode = "";

  void _activeRobotMode(String mode) {
    setState(() {
      myMode = mode;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CustomText(
          text: "$mode mode activated!",
          fontSize: 22.0,
          fontColor: AppColors.textColor,
        ),
        backgroundColor: AppColors.primaryColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(10.0, 60.0, 10.0, 0),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 40,
                    color: AppColors.icons,
                  ),
                ),
                const SizedBox(width: 10),
                const CustomTitle(),
              ],
            ),

            const SizedBox(height: 200.0),
            const CustomText(
              text: 'Which mode do you \n want to try today?',
              fontSize: 29.0,
            ),

            const SizedBox(height: 80.0),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  text: "Face ID",
                  fontSize: 22.0,
                  width: 120.0,
                  height: 60.0,
                  fontColor: const Color(0xffEBEBEB),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FaceIDScreen(),
                    ),
                  ),
                ),

                CustomButton(
                  text: "Detection",
                  fontSize: 22.0,
                  width: 120.0,
                  height: 60.0,
                  isActive: myMode == "Object",
                  onTap: () {
                    _activeRobotMode("Object");
                  },
                ),

                CustomButton(
                  text: "Greeting",
                  fontSize: 22.0,
                  width: 120.0,
                  height: 60.0,
                  isActive: myMode == "Greeting",
                  onTap: () {
                    _activeRobotMode("Greeting");
                  },
                ),
              ],
            ),

            const SizedBox(height: 25.0),
            CustomModesButtons(
              text: myMode == "Object" ? "Object is" : "Hello, ",
            ),
          ],
        ),
      ),
    );
  }
}
