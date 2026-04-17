import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_robo/core/networking/api_constants.dart';
import 'package:mini_robo/core/networking/api_service.dart';
import 'package:mini_robo/features/camera_screens/data/repos/camera_repo.dart';
import 'package:mini_robo/features/camera_screens/logic/cubit/camera_states.dart';

class CameraCubit extends Cubit<CameraState> {
  final CameraRepo cameraRepository;
  final ApiService apiService;
  CameraCubit(this.cameraRepository, this.apiService)
    : super(CameraInitialState());
  Future<void> activateMode(String mode) async {
    emit(CameraLoadingState());

    try {
      final bool isSuccess = await cameraRepository.activateMode(mode);

      if (isSuccess) {
        emit(CameraSuccessState("Mode $mode activated successfully!"));
      } else {
        emit(
          CameraErrorState(
            "Failed to activate mode. Server returned an error.",
          ),
        );
      }
    } catch (e) {
      emit(CameraErrorState("Network error: ${e.toString()}"));
    }
  }

  void resetState() {
    emit(CameraInitialState());
  }

  Future<void> registerUser(String name, File imageFile) async {
    emit(CameraLoadingState());
    try {
      final bool isSuccess = await cameraRepository.register(name, imageFile);

      if (isSuccess) {
        emit(
          CameraSuccessState(
            "User registered successfully! Welcome, $name! 🎉",
          ),
        );
      } else {
        emit(CameraErrorState("Failed to register user."));
      }
    } catch (e) {
      emit(CameraErrorState("Network error: ${e.toString()}"));
    }
  }

  Future<void> activateGreeting() async {
    emit(CameraLoadingState());

    try {
      final String? detectedName = await cameraRepository.getDetectedName();

      if (detectedName != null && detectedName != "Unknown") {
        emit(CameraSuccessState("Hello, $detectedName! 😊"));
      } else {
        emit(CameraSuccessState("Welcome! Happy to see you. ✨"));
      }
    } catch (e) {
      emit(CameraErrorState("فشل الاتصال: تأكد من تشغيل السيرفر والشبكة"));
    }
  }

  // داخل CameraCubit
  Future<void> startAutoGreeting() async {
    emit(CameraLoadingState());

    final Uint8List? imageBytes = await apiService.captureFromRobot();

    if (imageBytes != null) {
      String base64Image = base64Encode(imageBytes);

      final String? name = await cameraRepository.recognizeFromImage(
        base64Image,
      );

      if (name != null && name != "Unknown") {
        emit(CameraSuccessState("Hello, $name!"));

        await apiService.sendRobotCommand(ApiConstants.robotGreet);
      } else {
        emit(CameraSuccessState("Welcome!"));
      }
    } else {
      emit(CameraErrorState("Could not connect to Robot Camera"));
    }
  }
}
