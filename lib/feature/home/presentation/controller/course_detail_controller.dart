import 'package:fitnessai/di.dart';
import 'package:fitnessai/feature/courses/presentation/cubit/courses_cubit.dart';
import 'package:fitnessai/feature/home/presentation/pages/courses_detail_page.dart';
import 'package:fitnessai/feature/workout/presentation/cubit/workout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseDetailController extends StatelessWidget {
  const CourseDetailController({super.key, required this.courseKey});
  final String courseKey;

  @override
  Widget build(BuildContext context) {
    final WorkoutCubit workoutCubit = getIt.get();
    final CoursesCubit coursesCubit = getIt.get();
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: workoutCubit),
        BlocProvider.value(value: coursesCubit),
      ],
      child: CoursesDetailPage(courseKey: courseKey),
    );
  }
}
