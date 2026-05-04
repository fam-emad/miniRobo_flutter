import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_robo/core/networking/api_constants.dart';
import 'package:mini_robo/core/networking/http_repo.dart';
import 'package:mini_robo/logic/movement/movement_states.dart';

class MovementCubit extends Cubit<MovementState> {
  final HttpRepo repo;
  MovementCubit(this.repo) : super(MovementInitial());

  Future<void> _customRequest(
    Future<bool> request,
    String successMsg,
    String errorMsg,
  ) async {
    try {
      emit(MovementLoading());
      final response = await request;
      if (response == true) {
        emit(MovementSuccess(successMsg));
      } else {
        emit(MovementError(errorMsg));
      }
    } on DioException catch (e) {
      emit(MovementError("Network error: ${e.toString()}"));
    }
  }

  Future<void> dancing() async {
    await _customRequest(
      repo.activateMood(ApiConstants.dancing),
      "Dancing mood activated successfully",
      "Dancing can not activate",
    );
    log("Dancing ON");
  }

  Future<void> greeting() async {
    await _customRequest(
      repo.activateMood(ApiConstants.greeting),
      "Greeting mood activated successfully",
      "Greeting can not activate",
    );
    log("Greeting ON");
  }

  Future<void> manualMovement(mode) async {
    try {
      await repo.activateMood(mode);
      log("Movement ON");
    } on DioException catch (e) {
      log("Error sending manual command: $e");
    }
  }

  Future<void> toggleManualMode(bool isOn) async {
    try {
      await repo.activateMood(isOn ? "ON" : "OFF");
    } catch (e) {
      log("Error sending manual command: $e");
    }
  }

  void resetState() {
    emit(MovementInitial());
    log("Movement OFF");
  }
}
