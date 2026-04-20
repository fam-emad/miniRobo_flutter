import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_robo/core/networking/api_service.dart';
import 'package:mini_robo/features/camera_screens/data/repos/camera_repo.dart';
import 'package:mini_robo/features/camera_screens/logic/cubit/camera_cubit.dart';
import 'package:mini_robo/features/camera_screens/widgets/camera_file.dart';
import 'package:mini_robo/features/camera_screens/widgets/camera_modes_screen.dart';
import 'package:mini_robo/shared/buttons/custom_button.dart';
import 'package:mini_robo/shared/texts/custom_text.dart';
import 'package:mini_robo/shared/texts/custom_title.dart';

class Camera extends StatelessWidget {
  const Camera({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: sw * 0.05),
          child: Column(
            children: [
              SizedBox(height: sh * 0.02),
              const CustomTitle(),

              // Spacer spreads elements out evenly based on screen height
              const Spacer(flex: 2),

              CustomText(
                text: 'Would you like to make\nmini robot remember you?',
                fontSize: sw * 0.060, // Responsive font
                fontWeight: FontWeight.bold,
              ),

              const Spacer(flex: 1),

              CustomButton(
                text: "Yes, let's do it",
                fontSize: sw * 0.08,
                width: sw * 0.9, // 90% of screen width
                height: sh * 0.1, // 10% of screen height
                fontColor: const Color(0xffEBEBEB),
                onTap: () {
                  context.read<CameraCubit>().resetState();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FaceIDScreen(),
                    ),
                  );
                },
              ),

              const Spacer(flex: 1),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocProvider(
                        create: (context) {
                          final apiService = ApiService();
                          return CameraCubit(
                            CameraRepo(apiService),
                            apiService,
                          );
                        },
                        child: const CameraModesScreen(),
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    CustomText(text: 'No thanks,', fontSize: sw * 0.06, fontWeight: FontWeight.bold),
                    CustomText(
                      text: 'Just open Robot camera',
                      fontSize: sw * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),

              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
