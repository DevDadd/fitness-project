import 'dart:async';

import 'package:fitnessai/feature/map_drawing/presentation/cubit/mapdraw_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class MapdrawCubit extends Cubit<MapdrawState> {
  MapdrawCubit() : super(MapdrawState());
  StreamSubscription<Position>? _positionSubscription;
  final Distance distance = Distance();

  Future<void> getCurrentLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return;
    }

    final position = await Geolocator.getCurrentPosition();
    emit(
      state.copyWith(
        currentLocation: LatLng(position.latitude, position.longitude),
      ),
    );
  }

  Future<void> startTracking() async {
    final permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return;
    }
    emit(state.copyWith(isTracking: true));
    _positionSubscription =
        Geolocator.getPositionStream(
          locationSettings: LocationSettings(
            accuracy: LocationAccuracy.high,
            distanceFilter: 5,
          ),
        ).listen((position) {
          final newPoint = LatLng(position.latitude, position.longitude);
          final updatePath = List<LatLng>.from(state.paths)..add(newPoint);
          double newDistance = state.distance;
          if (updatePath.length > 1) {
            final prev = updatePath[updatePath.length - 2];
            final d = distance.as(LengthUnit.Meter, prev, newPoint);
            if (d > 2) {
              newDistance += d;
            }
          }
          emit(state.copyWith(paths: updatePath, distance: newDistance));
        });
  }

  Future<void> stopTracking() async {
    await _positionSubscription?.cancel();
    emit(state.copyWith(isTracking: false));
  }

  void reset() {
    emit(MapdrawState());
  }

  void loadDemoRoute() {
    var base = state.currentLocation;
    final demoPath = <LatLng>[
      const LatLng(21.0278, 105.8530),
      const LatLng(21.0283, 105.8538),
      const LatLng(21.0292, 105.8542),
      const LatLng(21.0298, 105.8550),
      const LatLng(21.0294, 105.8560),
      const LatLng(21.0285, 105.8565),
      const LatLng(21.0276, 105.8558),
      const LatLng(21.0272, 105.8548),
      base ?? const LatLng(0, 0),
    ];
    var totalMeters = 0.0;
    for (var i = 1; i < demoPath.length; i++) {
      totalMeters += distance.as(
        LengthUnit.Meter,
        demoPath[i - 1],
        demoPath[i],
      );
    }
    emit(
      state.copyWith(paths: demoPath, distance: totalMeters, isTracking: false),
    );
  }
}
