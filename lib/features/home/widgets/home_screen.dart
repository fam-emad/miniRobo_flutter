import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_robo/core/utils/app_colors.dart';
import 'package:mini_robo/features/home/logic/cubit/movement_cubit.dart';
import 'package:mini_robo/features/home/logic/cubit/movement_states.dart';
import 'package:mini_robo/shared/buttons/custom_button.dart';
import 'package:mini_robo/shared/buttons/custom_glass_box.dart';
import 'package:mini_robo/shared/texts/custom_text.dart';
import 'package:mini_robo/shared/texts/custom_title.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // حساب الأبعاد بناءً على الشاشة الحالية
    final double sw = MediaQuery.of(context).size.width;
    final double sh = MediaQuery.of(context).size.height;

    return BlocListener<MovementCubit, MovementState>(
      listener: (context, state) {
        if (state is MovementSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is MovementError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error), backgroundColor: Colors.red),
          );
        }
      },
      child: Scaffold(
        // استخدام التغليف بـ SafeArea لمنع التداخل مع الحواف
        body: Container(
          width: sw,
          height: sh,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.primaryColor,
                AppColors.primaryColor,
                AppColors.secondaryColor,
                AppColors.secondaryColor,
              ],
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              // هذا يمنع خطأ الـ Overflow تماماً
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: sw * 0.02),
                child: Column(
                  children: [
                    SizedBox(height: sh * 0.02),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // الجزء الأيسر: البطارية والطاقة
                        SizedBox(
                          width: sw * 0.45,
                          child: Column(
                            children: [
                              CustomGlassBox(
                                icon: Icons.flash_on,
                                text: 'Battery',
                                width: sw * 0.4,
                                height: sh * 0.16,
                              ),
                              const SizedBox(height: 10),
                              CustomGlassBox(
                                icon: Icons.energy_savings_leaf,
                                text: 'Power',
                                fontColor: AppColors.primaryColor,
                                iconcolor: Colors.green,
                                width: sw * 0.4,
                                height: sh * 0.16,
                              ),
                            ],
                          ),
                        ),
                        // الجزء الأيمن: صورة الروبوت
                        Expanded(
                          child: Image.asset(
                            'assets/images/robot_idle.png',
                            height: sh * 0.35,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: sh * 0.05),
                    const CustomTitle(),
                    SizedBox(height: sh * 0.02),
                    // الزر الرئيسي
                    CustomButton(
                      text: 'Start the party',
                      fontSize: sw * 0.06,
                      fontColor: AppColors.textColor,
                      width: sw * 0.85,
                      height: sh * 0.12,
                      isImage: true,
                      onTap: () {
                        context.read<MovementCubit>().startDanceParty();
                      },
                      backColor: AppColors.textColor2,
                    ),
                    SizedBox(height: sh * 0.05),
                    CustomText(
                      text: "Let’s explore more with",
                      fontSize: sw * 0.055,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: "Chief Smile Officer",
                      fontSize: sw * 0.055,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: sh * 0.02), // مسافة أمان أخيرة
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
