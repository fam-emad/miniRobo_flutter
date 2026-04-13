import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:gap/gap.dart';
import 'package:mini_robo/core/app_colors.dart';
import 'package:mini_robo/shared/buttons/custom_button.dart';
import 'package:mini_robo/shared/texts/custom_text.dart';

class SwitchCustom extends StatefulWidget {
  const SwitchCustom({super.key});

  @override
  State<SwitchCustom> createState() => _SwitchCustomState();
}

class _SwitchCustomState extends State<SwitchCustom> {
  bool inManualMode = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              inManualMode = !inManualMode;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 700),
            width: 250,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.linearColor.withValues(alpha: 0.55),
                  AppColors.linearColor.withValues(alpha: 0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: AppColors.textColor2.withValues(alpha: 0.2),
                width: 3,
              ),
            ),
            child: Stack(
              children: [
                AnimatedAlign(
                  alignment: inManualMode
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  duration: const Duration(milliseconds: 700),
                  child: Container(
                    padding: const EdgeInsets.all(1.0),
                    width: 150,
                    height: 55,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      color: AppColors.primaryColor.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(27),
                    ),
                    child: Center(
                      child: CustomText(
                        text: inManualMode ? "Auto" : "Manual",
                        fontSize: 26,
                        isBlack: false,
                        fontColor: AppColors.textColor2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 30),

        !inManualMode
            ? Joystick(
                mode: JoystickMode.all,
                listener: (details) {
                  debugPrint("Joystick details: ${details.x}, ${details.y}");
                },
                base: const Image(
                  image: AssetImage("assets/images/Ellipse 4.png"),
                  width: 270,
                  fit: BoxFit.contain,
                ),
                stick: const Image(
                  image: AssetImage("assets/images/Ellipse 6.png"),
                  width: 150,
                  fit: BoxFit.contain,
                ),
              )
            : Column(
                children: [
                  const Gap(20),
                  CustomButton(
                    text: 'Forward',
                    fontSize: 30,
                    isImage: false,
                    backColor: AppColors.primaryColor,
                    fontColor: AppColors.textColor2,
                    width: 300,
                    height: 100,
                    forAutomatic: true,
                    onTap: () {},
                  ),
                  const Gap(20),
                  CustomButton(
                    text: 'Backward',
                    fontSize: 30,
                    isImage: false,
                    backColor: AppColors.primaryColor,
                    fontColor: AppColors.textColor2,
                    width: 300,
                    height: 100,
                    forAutomatic: true,
                    onTap: () {},
                  ),
                ],
              ),
      ],
    );
  }
}
