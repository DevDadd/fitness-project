// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localize_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LocalizeStateCWProxy {
  LocalizeState currentLanguage(String? currentLanguage);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `LocalizeState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// LocalizeState(...).copyWith(id: 12, name: "My name")
  /// ```
  LocalizeState call({String? currentLanguage});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfLocalizeState.copyWith(...)` or call `instanceOfLocalizeState.copyWith.fieldName(value)` for a single field.
class _$LocalizeStateCWProxyImpl implements _$LocalizeStateCWProxy {
  const _$LocalizeStateCWProxyImpl(this._value);

  final LocalizeState _value;

  @override
  LocalizeState currentLanguage(String? currentLanguage) =>
      call(currentLanguage: currentLanguage);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `LocalizeState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// LocalizeState(...).copyWith(id: 12, name: "My name")
  /// ```
  LocalizeState call({Object? currentLanguage = const $CopyWithPlaceholder()}) {
    return LocalizeState(
      currentLanguage: currentLanguage == const $CopyWithPlaceholder()
          ? _value.currentLanguage
          // ignore: cast_nullable_to_non_nullable
          : currentLanguage as String?,
    );
  }
}

extension $LocalizeStateCopyWith on LocalizeState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfLocalizeState.copyWith(...)` or `instanceOfLocalizeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LocalizeStateCWProxy get copyWith => _$LocalizeStateCWProxyImpl(this);
}
