import 'package:flutter/material.dart';
import 'package:mini_robo/core/networking/api_constants.dart';
import 'package:mini_robo/core/networking/socket_service.dart';
import 'package:mini_robo/core/utils/app_colors.dart';
import 'package:mini_robo/shared/buttons/custom_glass_box.dart';

class SwitchCustom extends StatefulWidget {
  const SwitchCustom({super.key});

  @override
  State<SwitchCustom> createState() => _SwitchCustomState();
}

class _SwitchCustomState extends State<SwitchCustom> {
  bool inManualMode = false;
  final SocketService socketService = SocketService();

  @override
  void initState() {
    socketService.connect("ws://${ApiConstants.aiServerIp}.100:81");
    return super.initState();
  }

  @override
  void dispose() {
    socketService.disconnect();
    super.dispose();
  }

  Widget _buildMovementBtn({
    required IconData icon,
    required String label,
    required String command,
    required Color backColor,
    double height = 100,
    double fontSize = 15,
    Color? iconColor,
  }) {
    return GestureDetector(
      onTapDown: (_) => _send(command), 
      onTapUp: (_) => _send('S'), 
      onTapCancel: () => _send('S'), 
      child: CustomGlassBox(
        icon: icon,
        text: label,
        fontColor: Colors.black,
        backColor: backColor,
        height: height,
        width: 110,
        iconsize: 40,
        iconcolor: iconColor ?? AppColors.primaryColor,
        radius: 10,
        fontSize: fontSize,
      ),
    );
  }

  void _send(String cmd) => socketService.sendCommand(cmd);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => setState(() => inManualMode = !inManualMode),
          child: _buildAnimatedToggle(),
        ),

        const SizedBox(height: 50),

        !inManualMode
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      _buildMovementBtn(
                        icon: Icons.keyboard_arrow_up,
                        label: 'UP',
                        command: 'L',
                        backColor: AppColors.textColor2,
                      ),
                      _buildMovementBtn(
                        icon: Icons.keyboard_arrow_down,
                        label: 'DWN',
                        command: 'L',
                        backColor: AppColors.textColor2,
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      _buildMovementBtn(
                        icon: Icons.keyboard_double_arrow_up,
                        label: 'FWD',
                        command: 'F',
                        backColor: AppColors.primaryColor,
                        height: 130,
                        fontSize: 17,
                        iconColor: AppColors.secondaryColor,
                      ),
                      _buildMovementBtn(
                        icon: Icons.keyboard_double_arrow_down,
                        label: 'BWD',
                        command: 'B',
                        backColor: AppColors.primaryColor,
                        height: 130,
                        fontSize: 17,
                        iconColor: AppColors.secondaryColor,
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      _buildMovementBtn(
                        icon: Icons.keyboard_arrow_up,
                        label: 'UP',
                        command: 'R',
                        backColor: AppColors.textColor2,
                      ),
                      _buildMovementBtn(
                        icon: Icons.keyboard_arrow_down,
                        label: 'DWN',
                        command: 'R',
                        backColor: AppColors.textColor2,
                      ),
                    ],
                  ),
                ],
              )
            : _buildJoystickView(),
      ],
    );
  }

  Widget _buildAnimatedToggle() {
    return Container();
  }

  Widget _buildJoystickView() {
    return Container(); 
  }
}
