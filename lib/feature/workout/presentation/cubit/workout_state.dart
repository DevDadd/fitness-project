import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:fitnessai/feature/workout/data/model/difficulty_model.dart';
import 'package:fitnessai/feature/workout/domain/entity/workout.dart';

part 'workout_state.g.dart';

@CopyWith()
class WorkoutState extends Equatable {
  WorkoutState({
    this.workoutsList = const [],
    this.difficultyLevels = const [],
  });
  List<Workout> workoutsList;
  List<DifficultyModel> difficultyLevels;
  @override
  List<Object> get props => [workoutsList, difficultyLevels];
}
