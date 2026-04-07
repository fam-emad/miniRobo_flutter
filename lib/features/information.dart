import 'package:flutter/material.dart';
import 'package:mini_robo/core/app_colors.dart';
import 'package:mini_robo/shared/bottom_navigation_custom.dart';
import 'package:mini_robo/shared/button_custom.dart';
import 'package:mini_robo/shared/custom_glass_box.dart';
import 'package:mini_robo/shared/second_custome_text.dart';
import 'package:mini_robo/shared/title_custom.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    List<CustomGlassBox> box = [
      CustomGlassBox(
        icon: Icons.flash_on,
        text: 'Battery',
        font_color: Colors.black,
        backColor: AppColors.primaryColor,
      ),
      CustomGlassBox(
        icon: Icons.energy_savings_leaf,
        text: 'Power',
        font_color: Colors.black,
        backColor: AppColors.primaryColor,
      ),
       CustomGlassBox(
        icon: Icons.energy_savings_leaf,
        text: 'Power',
        font_color: Colors.black,
        backColor: AppColors.primaryColor,
      ),
       CustomGlassBox(
        icon: Icons.energy_savings_leaf,
        text: 'Power',
        font_color: Colors.black,
        backColor: AppColors.primaryColor,
      ),
       CustomGlassBox(
        icon: Icons.energy_savings_leaf,
        text: 'Power',
        font_color: Colors.black,
        backColor: AppColors.primaryColor,
      ),
       
    ];
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 75.0, 0.0, 0),
          child: Column(
            children: [
              //SizedBox(height: 35),
              CustomTitle(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GridView.builder(
                  itemCount: box.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    childAspectRatio: 1 / 1,
                  ),
                  itemBuilder: (context, index) {
                    return box[index];
                  },
                ),
              ),
              //Spacer(),
             // Image(image: AssetImage('assets/images/robot_idle.png')),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationCustom(),
    );
  }
}
