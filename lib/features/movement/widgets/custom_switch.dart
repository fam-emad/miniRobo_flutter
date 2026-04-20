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
  final SocketService socketService = SocketService();
  bool inManualMode = false;

  void _send(String cmd) => socketService.sendCommand(cmd);

  @override
  void initState() {
    socketService.connect("ws://${ApiConstants.aiServerIp}:8080/");
    super.initState();
  }

  void toggleManualMode() {
    setState(() {
      inManualMode = !inManualMode;
      _send(
        inManualMode ? "MANUAL MOVEMENT MODE ON" : "MANUAL MOVEMENT MODE OFF",
      );
    });
  }

  @override
  void dispose() {
    socketService.disconnect();
    super.dispose();
  }

  // ويدجت الزر مع تحسينات في الحجم المتجاوب
  Widget _buildMovementBtn({
    required IconData icon,
    required String label,
    required String command,
    required Color backColor,
    required double sw, // عرض الشاشة
    double? heightFactor, // عامل الطول بالنسبة للشاشة
  }) {
    return GestureDetector(
      onTapDown: (_) => _send("$command START"),
      onTapUp: (_) => _send("$command STOP"),
      onTapCancel: () => _send("$command STOP"),
      child: CustomGlassBox(
        icon: icon,
        text: label,
        fontColor: Colors.black,
        backColor: backColor,
        // حسابات ديناميكية تعتمد على عرض الشاشة
        height: heightFactor != null ? (sw * heightFactor) : (sw * 0.26),
        iconsize: sw * 0.09,
        iconcolor: AppColors.primaryColor,
        radius: 12,
        fontSize: sw * 0.035,
      ),
    );
  }

  // داخل ملف custom_switch.dart - تعديل الـ build
  // داخل ملف custom_switch.dart
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double sw = constraints.maxWidth;

        return SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                // استخدام spaceEvenly لتوزيع العناصر داخل المساحة المتاحة من الـ Expanded
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 1. زر التفعيل (Toggle)
                  GestureDetector(
                    onTap: toggleManualMode,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: sw * 0.45,
                      height: 50,
                      decoration: BoxDecoration(
                        color: inManualMode
                            ? AppColors.primaryColor
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          inManualMode ? "MANUAL ON" : "MANUAL OFF",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: sw * 0.04,
                            color: inManualMode ? Colors.white : Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ),

                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: inManualMode ? 1.0 : 0.3,
                    child: AbsorbPointer(
                      absorbing: !inManualMode,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildSideColumn(sw, 'LH'),

                          Column(
                            children: [
                              Expanded(
                                child: _buildMovementBtn(
                                  icon: Icons.keyboard_double_arrow_up,
                                  label: 'FWD',
                                  command: 'MOVE FORWARD',
                                  backColor: AppColors.primaryColor.withOpacity(
                                    0.8,
                                  ),
                                  heightFactor: 0.30,
                                  sw: sw,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Expanded(
                                child: _buildMovementBtn(
                                  icon: Icons.keyboard_double_arrow_down,
                                  label: 'BWD',
                                  command: 'MOVE BACKWARD',
                                  backColor: AppColors.primaryColor.withOpacity(
                                    0.8,
                                  ),
                                  heightFactor: 0.30,
                                  sw: sw,
                                ),
                              ),
                            ],
                          ),

                          _buildSideColumn(sw, 'RH'),
                        ],
                      ),
                    ),
                  ),
                ],
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
        Expanded(
          child: _buildMovementBtn(
            icon: Icons.keyboard_arrow_up,
            label: '$prefix UP',
            command: '$prefix UP',
            backColor: AppColors.textColor2,
            sw: sw,
          ),
        ),
        const SizedBox(height: 15),
        Expanded(
          child: _buildMovementBtn(
            icon: Icons.keyboard_arrow_down,
            label: '$prefix DWN',
            command: '$prefix DOWN',
            backColor: AppColors.textColor2,
            sw: sw,
          ),
        ),
      ],
    );
  }
}
