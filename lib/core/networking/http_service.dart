import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:mini_robo/core/networking/api_constants.dart';

class HttpService {
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

  Future<void> sendCommand(String mode, {String? customUrl}) async {
    try {
      // final response = await http.get(
      //   Uri.parse('$ApiConstants.iotBaseUrl$ApiConstants.endpoint'),
      // );

      final url = Uri.parse(customUrl ?? ApiConstants.iotBaseUrl);
      final response = await client.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'active_mode': mode}),
      );
      if (response.statusCode == 200) {
        print("Command $mode sent successfully!");
      }
    } catch (e) {
      print("Error sending command: $e");
    }
  }

  void startDancing() => sendCommand('/dance');

  void startGreeting() => sendCommand('/greet');
}
