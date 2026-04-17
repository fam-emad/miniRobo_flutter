class ApiConstants {
  // --- AI Server (Laptop) ---
  static const String aiBaseUrl = "http://192.168.1.64:8000/flutter";

  // --- Robot (ESP32-CAM) ---
  static const String robotIp = "http://192.168.1.100";

  static const String socketUrl = "ws://192.168.1.100:81";

  // --- Endpoints ---
  static const String robotPhoto = "$robotIp/photo";
  static const String robotGreet = "$robotIp/greet";
  static const String robotDance = "$robotIp/dance";

  // ة--- Movement Endpoints ---
  static const String robotForward = "$robotIp/move/forward";
  static const String robotBackward = "$robotIp/move/backward";
  static const String robotLeft = "$robotIp/move/left";
  static const String robotRight = "$robotIp/move/right";
  static const String robotStop = "$robotIp/move/stop";
}
