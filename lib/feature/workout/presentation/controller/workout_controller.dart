import 'package:fitnessai/di.dart';
import 'package:fitnessai/feature/workout/presentation/cubit/workout_cubit.dart';
import 'package:fitnessai/feature/workout/presentation/pages/workoutlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutController extends StatelessWidget {
  const WorkoutController({super.key});

  @override
  Widget build(BuildContext context) {
    final WorkoutCubit workoutCubit = getIt.get();
    return BlocProvider.value(
      value: workoutCubit,
      child: const WorkoutlistPage(),
    );
  }
}
