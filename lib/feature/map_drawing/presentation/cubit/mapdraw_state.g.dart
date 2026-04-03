// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mapdraw_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MapdrawStateCWProxy {
  MapdrawState paths(List<LatLng> paths);

  MapdrawState isTracking(bool isTracking);

  MapdrawState distance(double distance);

  MapdrawState currentLocation(LatLng? currentLocation);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `MapdrawState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MapdrawState(...).copyWith(id: 12, name: "My name")
  /// ```
  MapdrawState call({
    List<LatLng> paths,
    bool isTracking,
    double distance,
    LatLng? currentLocation,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfMapdrawState.copyWith(...)` or call `instanceOfMapdrawState.copyWith.fieldName(value)` for a single field.
class _$MapdrawStateCWProxyImpl implements _$MapdrawStateCWProxy {
  const _$MapdrawStateCWProxyImpl(this._value);

  final MapdrawState _value;

  @override
  MapdrawState paths(List<LatLng> paths) => call(paths: paths);

  @override
  MapdrawState isTracking(bool isTracking) => call(isTracking: isTracking);

  @override
  MapdrawState distance(double distance) => call(distance: distance);

  @override
  MapdrawState currentLocation(LatLng? currentLocation) =>
      call(currentLocation: currentLocation);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `MapdrawState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MapdrawState(...).copyWith(id: 12, name: "My name")
  /// ```
  MapdrawState call({
    Object? paths = const $CopyWithPlaceholder(),
    Object? isTracking = const $CopyWithPlaceholder(),
    Object? distance = const $CopyWithPlaceholder(),
    Object? currentLocation = const $CopyWithPlaceholder(),
  }) {
    return MapdrawState(
      paths: paths == const $CopyWithPlaceholder() || paths == null
          ? _value.paths
          // ignore: cast_nullable_to_non_nullable
          : paths as List<LatLng>,
      isTracking:
          isTracking == const $CopyWithPlaceholder() || isTracking == null
          ? _value.isTracking
          // ignore: cast_nullable_to_non_nullable
          : isTracking as bool,
      distance: distance == const $CopyWithPlaceholder() || distance == null
          ? _value.distance
          // ignore: cast_nullable_to_non_nullable
          : distance as double,
      currentLocation: currentLocation == const $CopyWithPlaceholder()
          ? _value.currentLocation
          // ignore: cast_nullable_to_non_nullable
          : currentLocation as LatLng?,
    );
  }
}

extension $MapdrawStateCopyWith on MapdrawState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfMapdrawState.copyWith(...)` or `instanceOfMapdrawState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MapdrawStateCWProxy get copyWith => _$MapdrawStateCWProxyImpl(this);
}
