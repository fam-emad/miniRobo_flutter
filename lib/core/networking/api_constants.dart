class ApiConstants {
  //ai server
  static String aiServerIp = "192.168.11.129";

  //esp ip
  static String robotIp = "192.168.1.16";

  static String socketUrl = "ws://$aiServerIp:8080/";
  static String aiBaseUrl = "http://$aiServerIp:8000/flutter";

  static String iotBaseUrl = "http://$robotIp";

  static String robotDance = "$iotBaseUrl/dance";
  static String robotGreet = "$iotBaseUrl/greet";
  static String robotForward = "$iotBaseUrl/move/forward";
  static String robotBackward = "$iotBaseUrl/move/backward";
  static String robotStop = "$iotBaseUrl/move/stop";
}
