import 'dart:developer';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_robo/core/networking/api_constants.dart';
import 'package:mini_robo/core/networking/api_service.dart';
import 'package:mini_robo/logic/camera/data/models/ai_response.dart';
import 'package:mini_robo/logic/camera/data/repos/camera_repo.dart';
import 'package:mini_robo/logic/camera/cubit/camera_states.dart';

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
      final AiResponse? result = await cameraRepository.getDetectedResult("F");

      if (result != null && result.status == "success") {
        String name = result.userName ?? "Guest";
        emit(CameraSuccessState("Hello, $name! 😊"));
      } else {
        emit(CameraSuccessState("Scanning... Please face the robot camera."));
      }
    } catch (e) {
      emit(CameraErrorState("Network error: ${e.toString()}"));
    }
  }

  Future<void> startAutoGreeting() async {
    emit(CameraLoadingState());
    try {
      final String? name = await cameraRepository.getDetectedName("F");

      if (name != null && name != "Unknown") {
        log("HELLO $name");
        emit(CameraSuccessState("Hello, $name! 😊"));

        await apiService.sendCommand(ApiConstants.robotGreet);
      } else {
        emit(CameraSuccessState("Welcome! Happy to see you. ✨"));
      }
    } catch (e) {
      emit(CameraErrorState("Connection Error: ${e.toString()}"));
    }
  }
}
