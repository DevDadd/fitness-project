// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detect_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$DetectStateCWProxy {
  DetectState video(XFile? video);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `DetectState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DetectState(...).copyWith(id: 12, name: "My name")
  /// ```
  DetectState call({XFile? video});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfDetectState.copyWith(...)` or call `instanceOfDetectState.copyWith.fieldName(value)` for a single field.
class _$DetectStateCWProxyImpl implements _$DetectStateCWProxy {
  const _$DetectStateCWProxyImpl(this._value);

  final DetectState _value;

  @override
  DetectState video(XFile? video) => call(video: video);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `DetectState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// DetectState(...).copyWith(id: 12, name: "My name")
  /// ```
  DetectState call({Object? video = const $CopyWithPlaceholder()}) {
    return DetectState(
      video: video == const $CopyWithPlaceholder()
          ? _value.video
          // ignore: cast_nullable_to_non_nullable
          : video as XFile?,
    );
  }
}

extension $DetectStateCopyWith on DetectState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfDetectState.copyWith(...)` or `instanceOfDetectState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$DetectStateCWProxy get copyWith => _$DetectStateCWProxyImpl(this);
}
