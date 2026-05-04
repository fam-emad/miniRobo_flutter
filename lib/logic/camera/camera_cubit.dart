import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_robo/core/networking/http_repo.dart';
import 'package:mini_robo/logic/camera/camera_states.dart';

class CameraCubit extends Cubit<CameraState> {
  final HttpRepo repo;
  CameraCubit(this.repo) : super(CameraInitialState());

  Future<void> _customRequest(
    Future<bool> request,
    String successMsg,
    String errorMsg,
  ) async {
    try {
      emit(CameraLoadingState());
      final response = await request;
      if (response == true) {
        emit(CameraSuccessState(successMsg));
      } else {
        emit(CameraErrorState(errorMsg));
      }
    } on DioException catch (e) {
      emit(CameraErrorState("Network error: ${e.message}"));
    } catch (e) {
      log("Unexpected error: $e");
      emit(CameraErrorState("Unexpected error: $e"));
    }
  }

  Future<void> register(String name, File imageFile) async {
    await _customRequest(
      repo.registerUser(name, imageFile),
      "User registered successfully",
      "Can not register user",
    );
    log("doing register");
  }

  Future<void> activateCameraModes(String mode) async {
    await _customRequest(
      repo.activateMood(mode),
      "mode activated successfully",
      "mode can not activate",
    );
    log("Activate mode");
  }

  Future<void> sendInfo(String mode) async {
    emit(CameraLoadingState());
    print('object');

    try {
      final success = await repo.activateMood(mode);

      if (success) {
        emit(CameraSuccessState("Command $mode executed"));
      } else {
        emit(CameraErrorState("Failed to execute $mode"));
      }
    } catch (e) {
      emit(CameraErrorState("Error: ${e.toString()}"));
    }
  }

  void resetState() {
    emit(CameraInitialState());
    log("reset camera");
  }
}
