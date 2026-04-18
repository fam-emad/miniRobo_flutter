class ApiConstants {
  // --- AI Server (Laptop) ---
  static const String aiServerIp = "192.168.137.1";
  static const String aiBaseUrl = "http://$aiServerIp:8000/flutter";

  // --- Robot (ESP32-CAM) ---
  static const String robotIp = "http://$aiServerIp.100";

  static const String socketUrl = "ws://$aiServerIp.100:81";

  // --- Endpoints ---
  static const String robotGreet = "$robotIp/greet";
  static const String robotDance = "$robotIp/dance";

  // ة--- Movement Endpoints ---
  static const String robotForward = "$robotIp/move/forward";
  static const String robotBackward = "$robotIp/move/backward";
  static const String robotLeft = "$robotIp/move/left";
  static const String robotRight = "$robotIp/move/right";
  static const String robotStop = "$robotIp/move/stop";
}
