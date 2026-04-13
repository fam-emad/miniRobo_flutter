import 'package:flutter/material.dart';

class OvalGradientTransform extends GradientTransform {
  const OvalGradientTransform(this.scaleX, this.scaleY);

  final double scaleX; // نسبة التمدد أفقياً
  final double scaleY; // نسبة الضغط عمودياً

  @override
  Matrix4 transform(Rect bounds, {TextDirection? textDirection}) {
    final double center_x = bounds.width / 2;
    final double center_y = bounds.height / 2;

    return Matrix4.identity()
      ..translate(center_x, center_y) // نقل نقطة الأصل للمركز
      ..scale(scaleX, scaleY) // تطبيق التغيير في الحجم (X و Y)
      ..translate(-center_x, -center_y); // إعادة نقطة الأصل لمكانها
  }
}
