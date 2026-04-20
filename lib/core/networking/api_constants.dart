class ApiConstants {
  // 1. عنوان الـ IP الخاص بجهاز الكمبيوتر (الذي يشغل سيرفر بايثون الوسيط)
  // ملاحظة: تأكد أن هذا هو الـ IP الحالي لجهازك في الشبكة
  static const String aiServerIp = "192.168.11.164";

  // 2. عنوان الـ IP الخاص بالروبوت (ESP32)
  // كما هو محدد في كود الـ C++ الخاص بك
  static const String robotIp = "192.168.1.16";

  // --- إعدادات الـ WebSocket ---
  // الروبوت يتصل بـ 8080، لذا يجب أن يتصل التطبيق بنفس المنفذ على السيرفر الوسيط
  static const String socketUrl = "ws://$aiServerIp:8080/";

  // --- AI Server Endpoints (لأوامر الرقص والتحية عبر السيرفر) ---
  static const String aiBaseUrl = "http://$aiServerIp:8000/flutter";

  // تصحيح: الأوامر تذهب للسيرفر الوسيط وهو يرسلها للروبوت
  static const String robotGreet = "http://$aiServerIp:8000/greet";
  static const String robotDance = "http://$aiServerIp:8000/dance";

  // --- الحركة اليدوية (إذا كنت تستخدم HTTP بدلاً من السوكت) ---
  static const String iotBaseUrl = "http://$aiServerIp:8000/move";
  static const String robotForward = "$iotBaseUrl/forward";
  static const String robotBackward = "$iotBaseUrl/backward";
  static const String robotStop = "$iotBaseUrl/stop";
}
