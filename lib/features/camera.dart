import 'package:flutter/material.dart';
import 'package:mini_robo/shared/blue_custom.dart';
import 'package:mini_robo/shared/second_custome_text.dart';
import 'package:mini_robo/shared/title_custom.dart';

class Camera extends StatelessWidget {
  const Camera({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 60.0, 0.0, 0),
      child: Center(
        child: Column(
          children: [
            CustomTitle(),

            const SizedBox(height: 150.0),

            const SecondCustomeText(
              text: '   Would you like to make \nmini robot remember you?',
              fontSize: 26.0,
            ),

            const SizedBox(height: 100.0),

            BlueCustom(),

            const SizedBox(height: 100.0),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Camera()),
                );
              },
              child: const SecondCustomeText(
                text: '               no thanks,\nJust open Robot camera',
                fontSize: 26.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
