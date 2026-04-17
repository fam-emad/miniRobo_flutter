import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_robo/core/networking/api_service.dart';
import 'movement_states.dart';

class MovementCubit extends Cubit<MovementState> {
  final ApiService apiService;

  MovementCubit(this.apiService) : super(MovementInitial());

  Future<void> startDanceParty() async {
    emit(MovementLoading());
    try {
      await apiService.sendRobotCommand("D");
      emit(MovementSuccess("The robot is dancing now!"));
    } catch (e) {
      emit(MovementError("Could not start the party. Check connection."));
    }
  }

  Future<void> stopMovement() async {
    try {
      await apiService.sendRobotCommand("S"); 
      emit(MovementInitial());
    } catch (e) {
      emit(MovementError("Error stopping the robot"));
    }
  }
}
