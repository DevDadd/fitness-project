// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CoreStateCWProxy {
  CoreState stepCount(int? stepCount);

  CoreState timestamp(DateTime? timestamp);

  CoreState pedestrianStatus(String? pedestrianStatus);

  CoreState statusTimestamp(DateTime? statusTimestamp);

  CoreState baseSteps(int? baseSteps);

  CoreState todaySteps(int? todaySteps);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CoreState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CoreState(...).copyWith(id: 12, name: "My name")
  /// ```
  CoreState call({
    int? stepCount,
    DateTime? timestamp,
    String? pedestrianStatus,
    DateTime? statusTimestamp,
    int? baseSteps,
    int? todaySteps,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCoreState.copyWith(...)` or call `instanceOfCoreState.copyWith.fieldName(value)` for a single field.
class _$CoreStateCWProxyImpl implements _$CoreStateCWProxy {
  const _$CoreStateCWProxyImpl(this._value);

  final CoreState _value;

  @override
  CoreState stepCount(int? stepCount) => call(stepCount: stepCount);

  @override
  CoreState timestamp(DateTime? timestamp) => call(timestamp: timestamp);

  @override
  CoreState pedestrianStatus(String? pedestrianStatus) =>
      call(pedestrianStatus: pedestrianStatus);

  @override
  CoreState statusTimestamp(DateTime? statusTimestamp) =>
      call(statusTimestamp: statusTimestamp);

  @override
  CoreState baseSteps(int? baseSteps) => call(baseSteps: baseSteps);

  @override
  CoreState todaySteps(int? todaySteps) => call(todaySteps: todaySteps);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CoreState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CoreState(...).copyWith(id: 12, name: "My name")
  /// ```
  CoreState call({
    Object? stepCount = const $CopyWithPlaceholder(),
    Object? timestamp = const $CopyWithPlaceholder(),
    Object? pedestrianStatus = const $CopyWithPlaceholder(),
    Object? statusTimestamp = const $CopyWithPlaceholder(),
    Object? baseSteps = const $CopyWithPlaceholder(),
    Object? todaySteps = const $CopyWithPlaceholder(),
  }) {
    return CoreState(
      stepCount: stepCount == const $CopyWithPlaceholder()
          ? _value.stepCount
          // ignore: cast_nullable_to_non_nullable
          : stepCount as int?,
      timestamp: timestamp == const $CopyWithPlaceholder()
          ? _value.timestamp
          // ignore: cast_nullable_to_non_nullable
          : timestamp as DateTime?,
      pedestrianStatus: pedestrianStatus == const $CopyWithPlaceholder()
          ? _value.pedestrianStatus
          // ignore: cast_nullable_to_non_nullable
          : pedestrianStatus as String?,
      statusTimestamp: statusTimestamp == const $CopyWithPlaceholder()
          ? _value.statusTimestamp
          // ignore: cast_nullable_to_non_nullable
          : statusTimestamp as DateTime?,
      baseSteps: baseSteps == const $CopyWithPlaceholder()
          ? _value.baseSteps
          // ignore: cast_nullable_to_non_nullable
          : baseSteps as int?,
      todaySteps: todaySteps == const $CopyWithPlaceholder()
          ? _value.todaySteps
          // ignore: cast_nullable_to_non_nullable
          : todaySteps as int?,
    );
  }
}

extension $CoreStateCopyWith on CoreState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCoreState.copyWith(...)` or `instanceOfCoreState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CoreStateCWProxy get copyWith => _$CoreStateCWProxyImpl(this);
}
