import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mini_robo/core/app_colors.dart';
import 'package:mini_robo/custom_bottom_navigation.dart';
import 'package:mini_robo/shared/buttons/custom_glass_box.dart';
import 'package:mini_robo/shared/texts/custom_title.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      //backgroundColor: Colors.lightGreenAccent,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0,73,0,0),
        child: Center(
          child: Stack(
            children: [
              
              Column(
                children: [
                  CustomTitle(),
                   Gap(20),
                     Row(
                    children: [
                      CustomGlassBox(
                      icon: Icons. phone_iphone,
                      text: 'Flutter',
                      font_color: Colors.black,
                      backColor: AppColors.textColor2,
                      height: 162,
                      width: 180,
                      iconsize: 80,
                    ),
                    CustomGlassBox(
                      icon: Icons.device_hub,
                      text: 'IOT',
                      font_color: Colors.black,
                      backColor: AppColors.primaryColor,
                       height: 162,
                      width: 180,
                      iconsize: 80,
                      iconcolor:AppColors.secondaryColor ,
                    ),
                    ],
                  ),
                  Gap(20),
                    Row(
                    children: [
                     
                    CustomGlassBox(
                      icon: Icons.auto_awesome,
                      text: 'AI',
                      font_color: Colors.black,
                      backColor: AppColors.primaryColor,
                      height: 162,
                      width: 180,
                      iconsize: 80,
                      iconcolor:AppColors.secondaryColor ,
                    ),
                    
                     CustomGlassBox(
                      icon: Icons. movie_edit,
                      text: 'Media',
                      font_color: Colors.black,
                      backColor: AppColors.textColor2,
                       height: 162,
                      width: 180,
                      iconsize: 80,
                    ),
                    ],
                  ),
                 Gap(20),
                    Row(
                    children: [
                     
                     
                    
                     CustomGlassBox(
                      icon: Icons. control_camera,
                      text: 'ROV',
                      font_color: Colors.black,
                      backColor: AppColors.textColor2,
                      height: 162,
                      width: 180,
                      iconsize: 80,
                    ),
                 
                    ],
                  ),
                  //Gap(100)
                ],
              ),
                  Positioned(
                   // left: 20,
                    bottom: -5,
                    right: 0,
                    child:  Image(image: AssetImage('assets/images/robot_learn.png'),width: 205,),
                  )
            ],
          ),
        ),
      ),

      // bottomNavigationBar: BottomNavigationCustom(),
    );
  }
}
