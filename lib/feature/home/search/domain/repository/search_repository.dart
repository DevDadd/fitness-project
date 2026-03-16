import 'package:fitnessai/feature/workout/domain/entity/workout.dart';

abstract class SearchRepository {
  Future<List<Workout>> searchWorkouts(String name);
}