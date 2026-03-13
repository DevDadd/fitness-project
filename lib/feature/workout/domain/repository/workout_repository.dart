import 'package:fitnessai/feature/workout/domain/entity/workout.dart';

abstract class WorkoutRepository {
  Future<List<Workout>> getWorkouts();
}