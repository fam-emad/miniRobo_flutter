import 'package:flutter/material.dart';
import 'package:mini_robo/core/app_colors.dart';

class SwitchCustom extends StatefulWidget {
  const SwitchCustom({super.key});

  @override
  State<SwitchCustom> createState() => _SwitchCustomState();
}

class _SwitchCustomState extends State<SwitchCustom> {
  bool inManualMode = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          inManualMode = !inManualMode;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 700),
        width: 250,
        height: 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.linearColor.withValues(alpha: 0.55),
              AppColors.linearColor.withValues(alpha: 0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: AppColors.textColor2.withValues(alpha: 0.2),
            width: 3,
          ),
        ),
        child: Stack(
          children: [
            AnimatedAlign(
              alignment: inManualMode
                  ? AlignmentGeometry.bottomRight
                  : AlignmentGeometry.bottomLeft,
              duration: Duration(milliseconds: 700),
              child: Container(
                padding: const EdgeInsets.all(1.0),
                width: 150,
                height: 55,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: AppColors.primaryColor.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Center(
                  child: Text(
                    inManualMode ? 'Manual' : 'Auto',
                    style: TextStyle(
                      fontFamily: 'inter',
                      fontWeight: FontWeight.w900,
                      fontSize: 26,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
