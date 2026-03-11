// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ActivityStateCWProxy {
  ActivityState currentWeek(List<DateTime> currentWeek);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ActivityState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ActivityState(...).copyWith(id: 12, name: "My name")
  /// ```
  ActivityState call({List<DateTime> currentWeek});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfActivityState.copyWith(...)` or call `instanceOfActivityState.copyWith.fieldName(value)` for a single field.
class _$ActivityStateCWProxyImpl implements _$ActivityStateCWProxy {
  const _$ActivityStateCWProxyImpl(this._value);

  final ActivityState _value;

  @override
  ActivityState currentWeek(List<DateTime> currentWeek) =>
      call(currentWeek: currentWeek);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `ActivityState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// ActivityState(...).copyWith(id: 12, name: "My name")
  /// ```
  ActivityState call({Object? currentWeek = const $CopyWithPlaceholder()}) {
    return ActivityState(
      currentWeek:
          currentWeek == const $CopyWithPlaceholder() || currentWeek == null
          ? _value.currentWeek
          // ignore: cast_nullable_to_non_nullable
          : currentWeek as List<DateTime>,
    );
  }
}

extension $ActivityStateCopyWith on ActivityState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfActivityState.copyWith(...)` or `instanceOfActivityState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ActivityStateCWProxy get copyWith => _$ActivityStateCWProxyImpl(this);
}
