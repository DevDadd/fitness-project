import 'package:fitnessai/feature/workout/domain/entity/workout.dart';

abstract class WorkoutRepository {
  Future<List<Workout>> getWorkouts();
  Future<Workout> getWorkoutById(String id);
  Future<List<Workout>> getWorkoutsByType(String type);
}
