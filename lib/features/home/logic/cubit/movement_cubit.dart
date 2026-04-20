import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_robo/core/networking/api_service.dart';
import 'movement_states.dart';

class MovementCubit extends Cubit<MovementState> {
  final ApiService apiService;

  MovementCubit(this.apiService) : super(MovementInitial());

  Future<void> startDanceParty() async {
    emit(MovementLoading());
    try {
      await apiService.sendCommand("/dance");
      emit(MovementSuccess("The robot is dancing now! 💃"));
    } catch (e) {
      emit(MovementError("Could not start the party. Check connection."));
    }
  }

  Future<void> stopDance() async {
    try {
      await apiService.sendCommand("/stop");
      emit(MovementInitial());
    } catch (e) {
      emit(MovementError("Failed to stop the robot"));
    }
  }

  Future<void> startGreeting() async {
    try {
      await apiService.sendCommand("/greet");
      emit(MovementSuccess("Robot says Hi! 👋"));
    } catch (e) {
      emit(MovementError("Error sending greeting"));
    }
  }
}
