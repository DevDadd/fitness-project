// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WorkoutStateCWProxy {
  WorkoutState workoutsList(List<Workout> workoutsList);

  WorkoutState difficultyLevels(List<String> difficultyLevels);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `WorkoutState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// WorkoutState(...).copyWith(id: 12, name: "My name")
  /// ```
  WorkoutState call({
    List<Workout> workoutsList,
    List<String> difficultyLevels,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfWorkoutState.copyWith(...)` or call `instanceOfWorkoutState.copyWith.fieldName(value)` for a single field.
class _$WorkoutStateCWProxyImpl implements _$WorkoutStateCWProxy {
  const _$WorkoutStateCWProxyImpl(this._value);

  final WorkoutState _value;

  @override
  WorkoutState workoutsList(List<Workout> workoutsList) =>
      call(workoutsList: workoutsList);

  @override
  WorkoutState difficultyLevels(List<String> difficultyLevels) =>
      call(difficultyLevels: difficultyLevels);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `WorkoutState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// WorkoutState(...).copyWith(id: 12, name: "My name")
  /// ```
  WorkoutState call({
    Object? workoutsList = const $CopyWithPlaceholder(),
    Object? difficultyLevels = const $CopyWithPlaceholder(),
  }) {
    return WorkoutState(
      workoutsList:
          workoutsList == const $CopyWithPlaceholder() || workoutsList == null
          ? _value.workoutsList
          // ignore: cast_nullable_to_non_nullable
          : workoutsList as List<Workout>,
      difficultyLevels:
          difficultyLevels == const $CopyWithPlaceholder() ||
              difficultyLevels == null
          ? _value.difficultyLevels
          // ignore: cast_nullable_to_non_nullable
          : difficultyLevels as List<String>,
    );
  }
}

extension $WorkoutStateCopyWith on WorkoutState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfWorkoutState.copyWith(...)` or `instanceOfWorkoutState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WorkoutStateCWProxy get copyWith => _$WorkoutStateCWProxyImpl(this);
}
