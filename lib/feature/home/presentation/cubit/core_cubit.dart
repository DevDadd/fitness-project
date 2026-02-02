import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fitnessai/feature/home/presentation/cubit/core_state.dart';
import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

class CoreCubit extends Cubit<CoreState> {
  CoreCubit() : super(CoreState());

  bool isInitialized = false;
  StreamSubscription<StepCount>? _stepCountSubscription;
  StreamSubscription<PedestrianStatus>? _pedestrianStatusSubscription;

  void onStepCount(StepCount event) {
    final int base = state.baseSteps == 0 ? event.steps : state.baseSteps!;
    final int todayStep = event.steps - base;
    emit(
      state.copyWith(
        stepCount: event.steps,
        baseSteps: base,
        todaySteps: todayStep < 0 ? 0 : todayStep,
        timestamp: event.timeStamp,
      ),
    );
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    emit(
      state.copyWith(
        pedestrianStatus: event.status,
        statusTimestamp: event.timeStamp,
      ),
    );
  }

  void onPedestrianStatusError(Object error) {
    emit(state.copyWith(pedestrianStatus: 'unknown'));
  }

  void onStepCountError(Object error) {
    debugPrint(error.toString());
  }

  void initPlatformState() {
    if (isInitialized) return;
    isInitialized = true;
    _stepCountSubscription?.cancel();
    _pedestrianStatusSubscription?.cancel();

    _stepCountSubscription = Pedometer.stepCountStream.listen(
      onStepCount,
      onError: onStepCountError,
    );
    _pedestrianStatusSubscription = Pedometer.pedestrianStatusStream.listen(
      onPedestrianStatusChanged,
      onError: onPedestrianStatusError,
    );
  }

  @override
  Future<void> close() {
    _stepCountSubscription?.cancel();
    _pedestrianStatusSubscription?.cancel();
    return super.close();
  }
}
