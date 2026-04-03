import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

part 'mapdraw_state.g.dart';

@CopyWith()
class MapdrawState extends Equatable {
  const MapdrawState({
    this.paths = const [],
    this.isTracking = false,
    this.distance = 0,
    this.currentLocation,
  });
  final List<LatLng> paths;
  final LatLng? currentLocation;
  final bool isTracking;
  final double distance;
  @override
  List<Object?> get props => [paths, currentLocation, isTracking, distance];
}
