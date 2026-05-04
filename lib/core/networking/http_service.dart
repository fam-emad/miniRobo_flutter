import 'dart:developer';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:mini_robo/core/networking/api_constants.dart';

class HttpService {
  final Dio dio;
  HttpService()
    : dio = Dio(
        BaseOptions(
          // baseUrl: ApiConstants.aiBaseUrl,
          connectTimeout: const Duration(seconds: 20),
          receiveTimeout: const Duration(seconds: 20),
        ),
      ) {
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: false,
        error: true,
        logPrint: (obj) => log(obj.toString()),
      ),
    );
  }

  Future<Response> sendAiRequest({
    required String mode,
    Uint8List? body,
  }) async {
    try {
      final response = await dio.post(
        ApiConstants.aiBaseUrl,
        data: body,
        options: Options(
          headers: {
            'mode': mode,
            if (body != null) 'Content-Length': body.length.toString(),
          },
          contentType: body != null ? 'image/jpeg' : 'application/json',
        ),
      );
      log("Sent to AI: $mode");
      return response;
    } on DioException catch (e) {
      log("Error sending command: ${e.message}");
      if (e.response != null) {
        log("Server Data: ${e.response?.data}");
      }
      rethrow;
    }
  }
}
