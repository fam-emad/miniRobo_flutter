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
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 60.0, 0.0, 0),
          child: Column(
            children: [
              CustomTitle(),
              

              SwitchCustom(),
             // SizedBox(height: 300),
               Spacer(),
              Row(
                children: [
                  SizedBox(width: 10),
                  Image(
                    image: AssetImage("assets/images/robot_walk.png"),
                    height: 270,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
