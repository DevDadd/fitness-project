import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'core_state.g.dart';

@CopyWith()
class CoreState extends Equatable {
  const CoreState({
    this.stepCount,
    this.timestamp,
    this.pedestrianStatus,
    this.statusTimestamp,
    this.baseSteps,
    this.todaySteps,
  });

  final int? stepCount;
  final DateTime? timestamp;
  final String? pedestrianStatus;
  final DateTime? statusTimestamp;
  final int? baseSteps;
  final int? todaySteps;

  @override
  List<Object?> get props => [
    stepCount,
    timestamp,
    pedestrianStatus,
    statusTimestamp,
    baseSteps,
    todaySteps,
  ];
}
