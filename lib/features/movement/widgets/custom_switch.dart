import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_robo/core/networking/api_constants.dart';
import 'package:mini_robo/core/utils/app_colors.dart';
import 'package:mini_robo/logic/movement/movement_cubit.dart';
import 'package:mini_robo/shared/buttons/custom_glass_box.dart';

class SwitchCustom extends StatefulWidget {
  const SwitchCustom({super.key});

  @override
  State<SwitchCustom> createState() => _SwitchCustomState();
}

class _SwitchCustomState extends State<SwitchCustom> {
  bool inManualMode = false;

  void toggleManualMode() {
    setState(() {
      inManualMode = !inManualMode;
      context.read<MovementCubit>().toggleManualMode(inManualMode);
    });
  }

  Widget _buildMovementBtn({
    required IconData icon,
    required String label,
    required String command,
    required Color backColor,
    required double sw,

    double? heightFactor,
  }) {
    return GestureDetector(
      onTapDown: (_) => context.read<MovementCubit>().manualMovement(command),
      onTapUp: (_) => context.read<MovementCubit>().manualMovement(ApiConstants.stop),
      onTapCancel: () =>context.read<MovementCubit>().manualMovement(ApiConstants.stop),
      child: CustomGlassBox(
        icon: icon,
        text: label,
        fontColor: Colors.black,
        backColor: backColor,
        width: sw * 0.3,
        height: heightFactor != null ? (sw * heightFactor) : (sw * 0.26),
        iconsize: sw * 0.09,
        iconcolor: AppColors.primaryColor,
        radius: 12,
        fontSize: sw * 0.025,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double sw = constraints.maxWidth;
        final double sh = constraints.maxHeight;

        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: sh * 0.07),

              GestureDetector(
                onTap: toggleManualMode,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: sw * 0.65,
                  height: 50,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: inManualMode
                        ? AppColors.primaryColor
                        : Colors.grey[400],
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      AnimatedAlign(
                        duration: const Duration(milliseconds: 300),
                        alignment: inManualMode
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            inManualMode ? "ON" : "OFF",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),

                      AnimatedAlign(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        alignment: inManualMode
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          width: 37,
                          height: 37,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black26, blurRadius: 2),
                            ],
                          ),
                          child: Icon(
                            inManualMode
                                ? Icons.check
                                : Icons.power_settings_new,
                            size: 18,
                            color: inManualMode
                                ? AppColors.primaryColor
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: sh * 0.04),

              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: inManualMode ? 1.0 : 0.3,
                child: AbsorbPointer(
                  absorbing: !inManualMode,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildSideColumn(sw, 'L'),

                      Column(
                        children: [
                          _buildMovementBtn(
                            icon: Icons.keyboard_double_arrow_up,
                            label: 'MF',
                            command: 'MF',
                            backColor: AppColors.primaryColor.withValues(
                              alpha: 0.8,
                            ),
                            heightFactor: 0.30,
                            sw: sw * 0.92,
                          ),
                          SizedBox(height: sh * 0.01),
                          _buildMovementBtn(
                            icon: Icons.keyboard_double_arrow_down,
                            label: 'MB',
                            command: 'MB',
                            backColor: AppColors.primaryColor.withValues(
                              alpha: 0.8,
                            ),
                            heightFactor: 0.30,
                            sw: sw * 0.92,
                          ),
                        ],
                      ),

                      _buildSideColumn(sw, 'R'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSideColumn(double sw, String prefix) {
    return Column(
      children: [
        _buildMovementBtn(
          icon: Icons.keyboard_arrow_up,
          label: '${prefix}U',
          command: '${prefix}U',
          backColor: AppColors.textColor2,
          sw: sw * 0.9,
        ),
        SizedBox(height: 5),
        _buildMovementBtn(
          icon: Icons.keyboard_arrow_down,
          label: '${prefix}D',
          command: '${prefix}D',
          backColor: AppColors.textColor2,
          sw: sw * 0.9,
        ),
      ],
    );
  }
}
