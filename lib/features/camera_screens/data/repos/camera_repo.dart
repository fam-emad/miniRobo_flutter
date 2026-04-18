import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:mini_robo/features/camera_screens/data/models/ai_response.dart';
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
      body: {'name': name, 'image': base64Image},
    );

    return response.statusCode == 200;
  }

  Future<String?> getDetectedName(String mode) async {
    try {
      final response = await apiService.sendAiRequest(mode: mode);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        return data['name'];
      } else {
        return "Unknown";
      }
    } catch (e) {
      rethrow;
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

  Future<AiResponse?> getDetectedResult(String mode) async {
    try {
      final response = await apiService.sendAiRequest(mode: mode);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return AiResponse.fromJson(data);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
