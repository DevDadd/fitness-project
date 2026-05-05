import 'package:fitnessai/feature/workout/domain/entity/workout.dart';
import 'package:fitnessai/feature/workout/domain/repository/workout_repository.dart';

class WorkoutUsecase {
  final WorkoutRepository workoutRepository;

  WorkoutUsecase(this.workoutRepository);

  Future<List<Workout>> call() async {
    return await workoutRepository.getWorkouts();
  }

  Future<Workout> getWorkoutById(String id) async {
    return await workoutRepository.getWorkoutById(id);
  }

  Future<List<Workout>> getWorkoutsByType(String type) async {
    return await workoutRepository.getWorkoutsByType(type);
  }
}
