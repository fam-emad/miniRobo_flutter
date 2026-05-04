import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:mini_robo/core/networking/http_service.dart';

class HttpRepo {
  final HttpService httpService;

  HttpRepo(this.httpService);

  Future<bool> activateMood(String mode) async {
    try {
      await httpService.sendAiRequest(mode: mode);
      return true;
    } on DioException {
      log("Error in activating mode");
      return false;
    }
  }

  Future<Uint8List> compressImage(File file) async {
    final bool isMobile = Platform.isAndroid || Platform.isIOS;

    if (isMobile) {
      var result = await FlutterImageCompress.compressWithFile(
        file.absolute.path,
        minWidth: 800,
        minHeight: 800,
        quality: 80,
        format: CompressFormat.jpeg,
      );
      if (result == null) throw Exception("Image compression failed");
      return result;
    } else {
      return await file.readAsBytes();
    }
  }

  Future<bool> registerUser(String name, File imageFile) async {
    try {
      final bytes = await compressImage(imageFile);
      final response = await httpService.sendAiRequest(mode: name, body: bytes);
      if (response.statusCode == 200) return true;
      return false;
    } on DioException catch (e) {
      log("Error sending command: ${e.message}");
      debugPrint("Register Error: $e");
      return false;
    }
  }
}
