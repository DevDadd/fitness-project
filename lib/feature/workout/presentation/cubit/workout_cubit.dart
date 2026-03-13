import 'package:bloc/bloc.dart';
import 'package:fitnessai/feature/workout/domain/usecase/workout_usecase.dart';
import 'package:fitnessai/feature/workout/presentation/cubit/workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  final WorkoutUsecase workoutUsecase;
  WorkoutCubit(this.workoutUsecase) : super(WorkoutState());
  Future<void> getWorkouts() async {
    final workouts = await workoutUsecase.call();
    emit(state.copyWith(workoutsList: workouts));
  }

  Future<void> getDifficultyLevels() async {
    emit(
      state.copyWith(
        difficultyLevels: ["Beginner"],
      ),
    );
  }
}
