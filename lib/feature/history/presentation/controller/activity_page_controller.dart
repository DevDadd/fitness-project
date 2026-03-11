import 'package:fitnessai/di.dart';
import 'package:fitnessai/feature/history/presentation/cubit/activity_cubit.dart';
import 'package:fitnessai/feature/history/presentation/pages/history_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityPageController extends StatelessWidget {
  const ActivityPageController({super.key});

  @override
  Widget build(BuildContext context) {
    final ActivityCubit activityCubit = getIt.get();
    return BlocProvider.value(value: activityCubit, child: HistoryPage());
  }
}
