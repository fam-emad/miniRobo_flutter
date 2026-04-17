import 'package:flutter/material.dart';

class OvalGradientTransform extends GradientTransform {
  const OvalGradientTransform(this.scaleX, this.scaleY);

  final double scaleX; // نسبة التمدد أفقياً
  final double scaleY; // نسبة الضغط عمودياً

  @override
  Matrix4 transform(Rect bounds, {TextDirection? textDirection}) {
    final double centerX = bounds.width / 2;
    final double centerY = bounds.height / 2;

    return Matrix4.identity()
      ..translate(centerX, centerY) // نقل نقطة الأصل للمركز
      ..scale(scaleX, scaleY) // تطبيق التغيير في الحجم (X و Y)
      ..translate(-centerX, -centerY); // إعادة نقطة الأصل لمكانها
  }
}
