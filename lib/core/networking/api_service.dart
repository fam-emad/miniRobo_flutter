import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:mini_robo/core/networking/api_constants.dart';

class ApiService {
  final http.Client client = http.Client();

  Future<http.Response> sendAiRequest({
    required String mode,
    dynamic body,
  }) async {
    final url = Uri.parse(ApiConstants.aiBaseUrl);
    log("Sent to AI: $mode");
    if (body != null) {}

    final headers = {
      'mode': mode,
      'Content-Type': body != null ? 'image/jpeg' : 'application/json',
    };

    var temp = await client
        .post(url, headers: headers, body: body)
        .timeout(const Duration(seconds: 60));

    return temp;
  }

  Future<void> sendCommand(String endpoint) async {
    try {
      final response = await http.get(
        Uri.parse('$ApiConstants.iotBaseUrl$ApiConstants.endpoint'),
      );
      if (response.statusCode == 200) {
        print("Command $endpoint sent successfully!");
      }
    } catch (e) {
      print("Error sending command: $e");
    }
  }

  void startDancing() => sendCommand('/dance');

  void startGreeting() => sendCommand('/greet');
}
