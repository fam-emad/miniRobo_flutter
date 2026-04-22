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
          padding: EdgeInsetsGeometry.fromLTRB(
            sw * 0.05,
            sw * 0.15,
            sw * 0.05,
            0,
          ),
          child: Column(
            children: [
              const CustomTitle(),
          
              const Expanded(flex: 5, child: SwitchCustom()),
          
              Flexible(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/robot_walk.png",
                      height: sh * 0.25,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
