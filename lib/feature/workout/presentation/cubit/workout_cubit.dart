import 'package:bloc/bloc.dart';
import 'package:fitnessai/feature/workout/data/model/difficulty_model.dart';
import 'package:fitnessai/feature/workout/domain/usecase/workout_usecase.dart';
import 'package:fitnessai/feature/workout/presentation/cubit/workout_state.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  final WorkoutUsecase workoutUsecase;
  WorkoutCubit(this.workoutUsecase) : super(WorkoutState());
  Future<void> getWorkouts() async {
    final workouts = await workoutUsecase.call();
    emit(state.copyWith(workoutsList: workouts));
  }

  Future<void> getWorkoutById(String id) async {
    emit(state.copyWith(detailWorkout: null, isLoadingDetail: true));
    try {
      final workout = await workoutUsecase.getWorkoutById(id);
      emit(state.copyWith(detailWorkout: workout, isLoadingDetail: false));
    } catch (_) {
      emit(state.copyWith(isLoadingDetail: false));
    }
  }

  Future<void> getDifficultyLevels() async {
    emit(
      state.copyWith(
        difficultyLevels: [
          DifficultyModel(
            difficultyLevel: "Beginner",
            color: const Color.fromARGB(255, 145, 237, 155),
            iconColor: const Color.fromARGB(255, 145, 237, 155),
            icon: FontAwesomeIcons.personRunning,
          ),
          DifficultyModel(
            difficultyLevel: "Intermediate",
            color: const Color.fromARGB(255, 241, 204, 100),
            iconColor: const Color.fromARGB(255, 241, 204, 100),
            icon: FontAwesomeIcons.batteryHalf,
          ),
          DifficultyModel(
            difficultyLevel: "Advanced",
            color: const Color.fromARGB(255, 218, 78, 78),
            iconColor: const Color.fromARGB(255, 218, 78, 78),
            icon: FontAwesomeIcons.fireFlameCurved,
          ),
        ],
      ),
    );
  }
}
