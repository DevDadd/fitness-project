import 'package:fitnessai/feature/workout/domain/entity/workout.dart';
import 'package:fitnessai/feature/workout/domain/repository/workout_repository.dart';

class WorkoutUsecase {
  final WorkoutRepository workoutRepository;

  WorkoutUsecase(this.workoutRepository);

  Future<List<Workout>> call() async {
    return await workoutRepository.getWorkouts();
  }
}
