import 'package:flutter/material.dart';
import 'package:mini_robo/features/camera_screens/widgets/camera_file.dart';
import 'package:mini_robo/features/camera_screens/widgets/camera_modes_screen.dart';
import 'package:mini_robo/shared/buttons/custom_button.dart';
import 'package:mini_robo/shared/texts/custom_text.dart';
import 'package:mini_robo/shared/texts/custom_title.dart';

class Camera extends StatelessWidget {
  const Camera({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(10.0, 60.0, 0.0, 0),
        child: Center(
          child: Column(
            children: [
              CustomTitle(),

              const SizedBox(height: 174.0),

              const CustomText(
                text: '   Would you like to make \nmini robot remember you?',
                fontSize: 29.0,
              ),

              const SizedBox(height: 32.0),

              Center(
                child: CustomButton(
                  text: "Yes, let's do it",
                  fontSize: 32.0,
                  width: 358.0,
                  height: 90.0,
                  fontColor: Color(0xffEBEBEB),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FaceIDScreen(),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 87.0),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CameraModesScreen(),
                    ),
                  );
                },
                child: const CustomText(
                  text: '               no thanks,\nJust open Robot camera',
                  fontSize: 26.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
