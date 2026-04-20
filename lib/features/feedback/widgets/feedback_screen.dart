import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mini_robo/core/utils/app_colors.dart';
import 'package:mini_robo/shared/buttons/custom_button.dart';
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
                fontSize: 29.0, fontWeight: FontWeight.bold,
              ),

              Gap(50),
              CustomButton(
                text: 'Perfect',
                fontSize: 30,
                backColor: AppColors.primaryColor,
                isImage: true,
                fontColor: AppColors.textColor2,
                width: 350,
                height: 70,
                icon: Icons.star_rate,
                iconsize: 50,
                iconcolor: AppColors.icons,
                onTap: () {},
              ),
              Gap(30),
              CustomButton(
                text: 'Good',
                fontSize: 30,
                backColor: AppColors.primaryColor,
                isImage: true,
                fontColor: AppColors.textColor2,
                width: 350,
                height: 70,
                icon: Icons.thumb_up,
                iconsize: 50,
                iconcolor: AppColors.icons,
                onTap: () {},
              ),
              Gap(30),
              CustomButton(
                text: 'Need Enhancement',
                fontSize: 30,
                backColor: AppColors.primaryColor,
                isImage: false,
                fontColor: AppColors.textColor2,
                width: 350,
                height: 70,
                icon: Icons.phone_iphone,
                iconsize: 50,
                iconcolor: AppColors.icons,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
