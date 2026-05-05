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
    this.detailWorkout,
    this.isLoadingDetail = false,
    this.workoutsListByType = const [],
  });
  final List<Workout> workoutsList;
  final List<Workout> workoutsListByType;
  final List<DifficultyModel> difficultyLevels;
  final Workout? detailWorkout;
  final bool isLoadingDetail;
  @override
  List<Object?> get props => [
    workoutsList,
    difficultyLevels,
    detailWorkout,
    isLoadingDetail,
    workoutsListByType,
  ];
}
