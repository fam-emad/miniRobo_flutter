import 'package:flutter/material.dart';
import 'package:mini_robo/core/app_colors.dart';
import 'package:mini_robo/shared/button_custom.dart';
import 'package:mini_robo/shared/custom_glass_box.dart';
import 'package:mini_robo/shared/second_custome_text.dart';
import 'package:mini_robo/shared/title_custom.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primaryColor,
              AppColors.primaryColor,
              AppColors.secondaryColor,
              AppColors.secondaryColor,
            ],
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    CustomGlassBox(icon: Icons.flash_on, text: 'Battery'),
                    CustomGlassBox(
                      icon: Icons.energy_savings_leaf,
                      text: 'Power',
                    ),
                  ],
                ),
                Image(image: AssetImage('assets/images/robot_idle.png')),
              ],
            ),
            SizedBox(height: 30),

            CustomTitle(),
            SizedBox(height: 20),

            ButtonCustom(
              text: 'Start the party',
              fontSize: 26,
              icon: Icons.music_note, isimage: true,
            ),

           // SizedBox(height: 150),
           Spacer(),
            SecondCustomeText(text: "Let’s explore more with", fontSize: 24),
            SecondCustomeText(text: "Chief Smile Officer", fontSize: 24),
          ],
        ),
      ),
    );
  }
}
