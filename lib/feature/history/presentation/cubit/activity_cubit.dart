import 'dart:math';

import 'package:fitnessai/feature/history/data/model/chartdata.dart';
import 'package:fitnessai/feature/history/presentation/cubit/activity_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ActivityCubit extends Cubit<ActivityState> {
  ActivityCubit() : super(ActivityState());
  List<DateTime> _getCurrentWeek() {
    DateTime now = DateTime.now();
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  void getCalenderData() {
    emit(state.copyWith(currentWeek: _getCurrentWeek()));
  }

  List<Chartdata> generateChartData() {
    final random = Random();

    return List.generate(12, (index) {
      int hour = index * 2;
      int value = 100 + random.nextInt(5) * 200;

      return Chartdata(date: '$hour:00', calories: value);
    });
  }
}
