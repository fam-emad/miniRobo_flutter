import 'dart:convert';
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

  Future<void> sendRobotCommand(String endpoint) async {
    try {
      await client.get(Uri.parse(endpoint));
    } catch (e) {
      debugPrint("Move Error: $e");
    }
  }
}
