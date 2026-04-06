import 'package:flutter/material.dart';
import 'package:mini_robo/shared/bottom_navigation_custom.dart';
import 'package:mini_robo/shared/switch_custom.dart';

class Movement extends StatefulWidget {
  const Movement({super.key});

  @override
  State<Movement> createState() => _MovementState();
}

class _MovementState extends State<Movement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 35.0, 0.0, 0),
        child: Column(children: [SwitchCustom()]),
      ),
      bottomNavigationBar: BottomNavigationCustom(),
    );
  }
}
