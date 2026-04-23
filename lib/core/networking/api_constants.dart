class ApiConstants {
  //ai server
  static String aiServerIp = "192.168.11.129";

  //esp ip
  static String robotIp = "192.168.1.16";

  static String socketUrl = "ws://$aiServerIp:8080/";

  static String aiBaseUrl = "http://$aiServerIp:8000/flutter";

  static String robotGreet = "http://$aiServerIp:8000/greet";
  static String robotDance = "http://$aiServerIp:8000/dance";

  static String iotBaseUrl = "http://$aiServerIp:8000/move";
  static String robotForward = "$iotBaseUrl/forward";
  static String robotBackward = "$iotBaseUrl/backward";
  static String robotStop = "$iotBaseUrl/stop";
}
