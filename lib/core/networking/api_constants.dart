class ApiConstants {
  //related to AI server
  static String aiServerIp = "192.168.11.188";
  static String get aiBaseUrl => "http://$aiServerIp:8000/flutter";
  // static String aiBaseUrl =
  //     "https://webhook.site/8f1bc6e4-51e5-46dd-b017-92d1456dd094";

  //modes
  static const String faceRecognition = 'F';
  static const String objectDetection = 'O';
  static const String dancing = 'D';
  static const String greeting = 'G';
  static const String stop = "S";
}
