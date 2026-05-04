// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courses_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CoursesStateCWProxy {
  CoursesState courses(List<CoursesEntity> courses);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CoursesState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CoursesState(...).copyWith(id: 12, name: "My name")
  /// ```
  CoursesState call({List<CoursesEntity> courses});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfCoursesState.copyWith(...)` or call `instanceOfCoursesState.copyWith.fieldName(value)` for a single field.
class _$CoursesStateCWProxyImpl implements _$CoursesStateCWProxy {
  const _$CoursesStateCWProxyImpl(this._value);

  final CoursesState _value;

  @override
  CoursesState courses(List<CoursesEntity> courses) => call(courses: courses);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `CoursesState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// CoursesState(...).copyWith(id: 12, name: "My name")
  /// ```
  CoursesState call({Object? courses = const $CopyWithPlaceholder()}) {
    return CoursesState(
      courses: courses == const $CopyWithPlaceholder() || courses == null
          ? _value.courses
          // ignore: cast_nullable_to_non_nullable
          : courses as List<CoursesEntity>,
    );
  }
}

extension $CoursesStateCopyWith on CoursesState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfCoursesState.copyWith(...)` or `instanceOfCoursesState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CoursesStateCWProxy get copyWith => _$CoursesStateCWProxyImpl(this);
}
