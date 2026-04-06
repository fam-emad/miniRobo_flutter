import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mini_robo/core/app_colors.dart';
import 'package:mini_robo/shared/black_custome_text.dart';
import 'package:mini_robo/shared/button_custom.dart';
import 'package:mini_robo/shared/custom_glass_box.dart';
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
              icon: Icons.music_note,
            ),

            SizedBox(height: 150),
            BlackCustomeText(text: "Let’s explore more with", fontSize: 24),
            BlackCustomeText(text: "Chief Smile Officer", fontSize: 24),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(155, 0, 0, 0).withValues(alpha: .2),
                blurRadius: 100,
                spreadRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.navBarColor,
                AppColors.primaryColor.withOpacity(0.3),
              ],
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          child: GNav(
            textStyle: TextStyle(
              fontSize: 14,
              fontFamily: 'inter',
              fontWeight: FontWeight.w900,
            ),
            backgroundColor: Colors.transparent,
            color: AppColors.primaryColor,
            activeColor: AppColors.textColor,
            iconSize: 26,
            tabBackgroundGradient: LinearGradient(
              colors: [
                AppColors.primaryColor.withValues(alpha: 0.5),
                AppColors.primaryColor.withValues(alpha: 0),
              ],
            ),
            gap: 8,
            tabs: [
              GButton(icon: Icons.smart_toy, text: 'Robot'),
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.settings, text: 'Settings'),
              GButton(icon: Icons.person, text: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
