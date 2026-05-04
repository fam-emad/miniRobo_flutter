import 'package:flutter/material.dart';
import 'package:mini_robo/shared/texts/custom_text.dart';

class CustomModesButtons extends StatefulWidget {
  final String text;
  const CustomModesButtons({super.key, required this.text});

  @override
  State<CustomModesButtons> createState() => _CustomModesButtonsState();
}

class _CustomModesButtonsState extends State<CustomModesButtons> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // نستخدم عرض الحاوية الأب كمرجع للنسب
        final double sw = constraints.maxWidth;

        return Container(
          // جعل الارتفاع نسبة من العرض ليبقى متناسقاً
          height: sw * 0.27,
          width: double.infinity, // يأخذ العرض المتاح كاملاً
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              sw * 0.13,
            ), // حواف دائرية متناسبة
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 15,
                spreadRadius: 1,
                offset: const Offset(0, 4),
              ),
            ],
            gradient: LinearGradient(
              colors: [
                Colors.black.withValues(alpha: 0.5),
                Colors.black.withValues(alpha: 0.2),
                Colors.black.withValues(alpha: 0.2),
                Colors.black.withValues(alpha: 0.1),
                Colors.black.withValues(alpha: 0.1),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(sw * 0.015), // Padding داخلي متجاوب
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(sw * 0.13),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: sw * 0.08),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        text: widget.text,
                        fontSize: sw * 0.065,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
