import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mini_robo/core/networking/api_constants.dart';

class ApiService {
  final http.Client client = http.Client();

  Future<http.Response> sendAiRequest({
    required String mode,
    Map<String, dynamic>? body,
  }) async {
    final url = Uri.parse(ApiConstants.aiBaseUrl);

    return await client.post(
      url,
      headers: {'Content-Type': 'application/json', 'mode': mode},
      body: body != null ? jsonEncode(body) : null,
    );
  }

  Future<Uint8List?> captureFromRobot() async {
    try {
      final response = await client.get(Uri.parse(ApiConstants.robotPhoto));
      if (response.statusCode == 200) {
        return response.bodyBytes; 
      }
    } catch (e) {
      debugPrint("Error capturing: $e");
    }
    return null;
  }

  Future<void> sendRobotCommand(String endpoint) async {
    try {
      await client.get(Uri.parse(endpoint));
    } catch (e) {
      debugPrint("Move Error: $e");
    }
  }
}
