import 'package:flutter/material.dart';
import 'package:mini_robo/core/app_colors.dart';
import 'package:mini_robo/shared/custom_blue.dart';
import 'package:mini_robo/shared/custom_bottom_navigation.dart';
import 'package:mini_robo/shared/custom_modes_buttons.dart';
import 'package:mini_robo/shared/custom_second_text.dart';
import 'package:mini_robo/shared/custom_second_textfield.dart';
import 'package:mini_robo/shared/custom_title.dart';

class FaceIDScreen extends StatefulWidget {
  const FaceIDScreen({super.key});

  @override
  State<FaceIDScreen> createState() => _FaceIDScreenState();
}

class _FaceIDScreenState extends State<FaceIDScreen> {
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

              const SizedBox(height: 480.0),

              BlueCustom(
                text: "Please Enter Your First Name",
                fontSize: 24.0,
                width: 380,
                height: 90.0,
                font_color: Color(0xffEBEBEB),
                navigateTo: null,
              ),

              Row(children: [CustomSecondTextfield()]),

              const SizedBox(height: 25.0),
            ],
          ),
        ),
      ),
    );
  }
}
