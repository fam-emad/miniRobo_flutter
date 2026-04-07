import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mini_robo/core/app_colors.dart';
import 'package:mini_robo/features/camera_screens/main_camera_screen.dart';
import 'package:mini_robo/features/home_screen.dart';
import 'package:mini_robo/features/information_screen.dart';
import 'package:mini_robo/features/movement_screen.dart';
 

class BottomNavigationCustom extends StatefulWidget {
  const BottomNavigationCustom({super.key});

  @override
  State<BottomNavigationCustom> createState() => _BottomNavigationCustomState();
}

class _BottomNavigationCustomState extends State<BottomNavigationCustom> {
  final List<Widget> pages = [
    const Home(),
    const Movement(),
    const Information(),
    const Camera(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],
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
                AppColors.navBarColor.withValues(alpha: 0.8),
                AppColors.primaryColor.withOpacity(0.3),
              ],
            ),
            borderRadius: BorderRadius.circular(30),
          ),

          child: GNav(
            selectedIndex: currentPage,
            onTabChange: (value) => setState(() {
              currentPage = value;
            }),
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
              GButton(icon: Icons.control_camera, text: 'Moving'),
              GButton(icon: Icons.my_library_books_rounded, text: 'Info'),
              GButton(icon: Icons.camera, text: 'Camera'),
            ],
          ),
        ),
      ),
    );
  }
}
