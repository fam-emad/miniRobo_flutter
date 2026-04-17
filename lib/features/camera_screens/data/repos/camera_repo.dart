import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

import '../../../../core/networking/api_service.dart';

class CameraRepo {
  final ApiService apiService;
  CameraRepo(this.apiService);

  Future<Uint8List> compressImage(File file) async {
    var result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      minWidth: 800,
      minHeight: 600,
      quality: 70,
    );
    return result!;
  }

  Future<bool> register(String name, File imageFile) async {
    Uint8List compressedBytes = await compressImage(imageFile);

    String base64Image = base64Encode(compressedBytes);

    final response = await apiService.sendAiRequest(
      mode: 'R',
      body: {'user_name': name, 'image': base64Image},
    );

    return response.statusCode == 200;
  }

  Future<String?> getDetectedName() async {
    try {
      final response = await apiService.sendAiRequest(mode: "F");

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        return data['user_name'];
      } else {
        return "Unknown";
      }
    } catch (e) {
      rethrow;
    }
  }


  Future<String?> recognizeFromImage(String base64Image) async {
    try {
      final response = await apiService.sendAiRequest(
        mode: 'F',
        body: {'image': base64Image},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data['user_name'];
      }
      return "Unknown";
    } catch (e) {
      debugPrint("Recognition Error: $e");
      return null;
    }
  }

  Future<bool> activateMode(String mode) async {
    try {
      final response = await apiService.sendAiRequest(mode: mode);
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
