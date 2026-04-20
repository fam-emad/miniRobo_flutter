import 'package:flutter/material.dart';
import 'package:mini_robo/features/movement/widgets/custom_switch.dart';
import 'package:mini_robo/shared/texts/custom_title.dart';

class Movement extends StatefulWidget {
  const Movement({super.key});

  @override
  State<Movement> createState() => _MovementState();
}

class _MovementState extends State<Movement> {
  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
          child: Column(
            children: [
              SizedBox(height: sh * 0.02),
              const CustomTitle(),

              // نعطي الأزرار 65% من مساحة الشاشة لضمان عدم ضغطها
              const Expanded(flex: 5, child: SwitchCustom()),

              // الصورة في الأسفل مع مساحة مرنة
              Flexible(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/robot_walk.png",
                      height: sh * 0.18, // تصغير الصورة قليلاً
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              SizedBox(height: sh * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
