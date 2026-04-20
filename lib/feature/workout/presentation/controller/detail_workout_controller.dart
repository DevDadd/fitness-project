import 'package:fitnessai/di.dart';
import 'package:fitnessai/feature/workout/presentation/cubit/workout_cubit.dart';
import 'package:fitnessai/feature/workout/presentation/pages/detail_workout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailWorkoutController extends StatelessWidget {
  const DetailWorkoutController({super.key, required this.workoutId});
  final String workoutId;
  @override
  Widget build(BuildContext context) {
    final WorkoutCubit workoutCubit = getIt.get();
    return BlocProvider.value(
      value: workoutCubit,
      child: DetailWorkoutPage(workoutId: workoutId),
    );
  }
}
