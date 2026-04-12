import 'package:flutter/material.dart';
import 'package:mini_robo/core/app_colors.dart';
import 'package:mini_robo/shared/buttons/custom_button.dart';
import 'package:mini_robo/shared/buttons/custom_glass_box.dart';
import 'package:mini_robo/shared/texts/custom_text.dart';
import 'package:mini_robo/shared/texts/custom_title.dart';

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
            SizedBox(height: 30),
            Row(
              children: [
                Column(
                  children: [
                    CustomGlassBox(icon: Icons.flash_on, text: 'Battery'),

                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(21.0, 15, 0.0, 0),
                          width: 141,
                          height: 126,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.7),
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.3),
                              width: 1.5,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.05),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                        ),
                        CustomGlassBox(
                          icon: Icons.energy_savings_leaf,
                          text: 'Power',
                          fontColor: AppColors.primaryColor,
                          iconcolor: Colors.green,
                        ),
                      ],
                    ),
                  ],
                ),

                Expanded(
                  flex: 2,
                  child: Image(
                    image: AssetImage('assets/images/robot_idle.png'),
                    height: 270,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),

            CustomTitle(),
            SizedBox(height: 20),

            CustomButton(
              text: 'Start the party',
              fontSize: 26,
              fontColor: AppColors.textColor,
              width: 310,
              height: 100,
              isImage: true,
              onTap: () {},
              backColor: AppColors.textColor2,
            ),

            Spacer(),
            CustomText(text: "Let’s explore more with", fontSize: 25),
            CustomText(text: "Chief Smile Officer", fontSize: 25),
          ],
        ),
      ),
    );
  }
}
