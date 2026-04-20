import 'package:fitnessai/feature/workout/data/datasource/workout_service.dart';
import 'package:fitnessai/feature/workout/data/model/workout_model.dart';
import 'package:fitnessai/feature/workout/domain/entity/workout.dart';
import 'package:fitnessai/feature/workout/domain/repository/workout_repository.dart';

class WorkoutDatasourceImpl implements WorkoutRepository {
  final WorkoutService workoutService;

  WorkoutDatasourceImpl(this.workoutService);

  @override
  Future<List<Workout>> getWorkouts() async {
    final response = await workoutService.getWorkouts();
    return response.map((model) => model.toEntity()).toList();
  }

  @override
  Future<Workout> getWorkoutById(String id) async {
    final response = await workoutService.getWorkoutById(id);
    return response.toEntity();
  }
}
