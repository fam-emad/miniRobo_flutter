class ApiConstants {
  //related to AI server
  static String aiServerIp = "172.16.46.95";
  static String aiBaseUrl = "http://$aiServerIp:8000/flutter";

  // static String robotDance = "http://$aiServerIp:8000/dance";
  // static String robotGreet = "http://$aiServerIp:8000/greet";

  //related to esp
  static String robotIp = "192.168.1.16";
  static String socketUrl = "ws://$robotIp:81/";
  static String robotStop = "http://$robotIp/move/stop";

  // static String iotBaseUrl = "http://$robotIp";
  // static String robotForward = "$iotBaseUrl/move/forward";
  // static String robotBackward = "$iotBaseUrl/move/backward";
  // static String robotStop = "$iotBaseUrl/move/stop";
}
