import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mini_robo/core/app_colors.dart';
import 'package:mini_robo/shared/buttons/custom_btm.dart';
import 'package:mini_robo/shared/texts/custom_text.dart';
import 'package:mini_robo/shared/texts/custom_title.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 73, 0, 0),
        child: Center(
          child: Column(
            children: [
              CustomTitle(),
              Gap(100),
              CustomText(
                text: 'Which mode do you \n  want to try today?',
                fontSize: 29.0,
              ),

              Gap(50),
              CustomBtm(
                text: 'Perfect',
                fontSize: 30,
                ccolor: AppColors.primaryColor,
                isimage: true,
                colorfont: AppColors.textColor2,
                width: 350,
                height: 70,
                icon: Icons.star_rate,
                iconsize: 50,
                iconcolor: AppColors.icons,
              ),
              Gap(30),
               CustomBtm(
                text: 'Good',
                fontSize: 30,
                ccolor: AppColors.primaryColor,
                isimage: true,
                colorfont: AppColors.textColor2,
                width: 350,
                height: 70,
                icon: Icons.thumb_up,
                iconsize: 50,
                iconcolor: AppColors.icons,
              ),
              Gap(30),
               CustomBtm(
                text: 'Need Enhancement',
                fontSize: 30,
                ccolor: AppColors.primaryColor,
                isimage: false,
                colorfont: AppColors.textColor2,
                width: 350,
                height: 70,
                icon: Icons.phone_iphone,
                iconsize: 50,
                iconcolor: AppColors.icons,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
