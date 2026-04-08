// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthenticationStateCWProxy {
  AuthenticationState status(AuthenticationStatus status);

  AuthenticationState loginResponse(LoginResponse? loginResponse);

  AuthenticationState errorMessage(String errorMessage);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AuthenticationState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AuthenticationState(...).copyWith(id: 12, name: "My name")
  /// ```
  AuthenticationState call({
    AuthenticationStatus status,
    LoginResponse? loginResponse,
    String errorMessage,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfAuthenticationState.copyWith(...)` or call `instanceOfAuthenticationState.copyWith.fieldName(value)` for a single field.
class _$AuthenticationStateCWProxyImpl implements _$AuthenticationStateCWProxy {
  const _$AuthenticationStateCWProxyImpl(this._value);

  final AuthenticationState _value;

  @override
  AuthenticationState status(AuthenticationStatus status) =>
      call(status: status);

  @override
  AuthenticationState loginResponse(LoginResponse? loginResponse) =>
      call(loginResponse: loginResponse);

  @override
  AuthenticationState errorMessage(String errorMessage) =>
      call(errorMessage: errorMessage);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `AuthenticationState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// AuthenticationState(...).copyWith(id: 12, name: "My name")
  /// ```
  AuthenticationState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? loginResponse = const $CopyWithPlaceholder(),
    Object? errorMessage = const $CopyWithPlaceholder(),
  }) {
    return AuthenticationState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as AuthenticationStatus,
      loginResponse: loginResponse == const $CopyWithPlaceholder()
          ? _value.loginResponse
          // ignore: cast_nullable_to_non_nullable
          : loginResponse as LoginResponse?,
      errorMessage:
          errorMessage == const $CopyWithPlaceholder() || errorMessage == null
          ? _value.errorMessage
          // ignore: cast_nullable_to_non_nullable
          : errorMessage as String,
    );
  }
}

extension $AuthenticationStateCopyWith on AuthenticationState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfAuthenticationState.copyWith(...)` or `instanceOfAuthenticationState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthenticationStateCWProxy get copyWith =>
      _$AuthenticationStateCWProxyImpl(this);
}
