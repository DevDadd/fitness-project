import 'package:fitnessai/feature/workout/presentation/cubit/workout_cubit.dart';
import 'package:fitnessai/feature/workout/presentation/cubit/workout_state.dart';
import 'package:fitnessai/feature/workout/presentation/widget/difficulty_widget.dart';
import 'package:fitnessai/feature/workout/presentation/widget/exercises_widget.dart';
import 'package:fitnessai/feature/workout/presentation/widget/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CoursesDetailPage extends StatefulWidget {
  const CoursesDetailPage({super.key, required this.courseKey});
  final String courseKey;
  @override
  State<CoursesDetailPage> createState() => _CoursesDetailPageState();
}

class _CoursesDetailPageState extends State<CoursesDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<WorkoutCubit>().getDifficultyLevels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Workout List',
                style: GoogleFonts.inter(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20.h),

              Text(
                "Browse the course .",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFC4C4C4),
                ),
              ),

              SizedBox(height: 20.h),

              /// Difficulty Levels
              BlocBuilder<WorkoutCubit, WorkoutState>(
                buildWhen: (p, c) => p.difficultyLevels != c.difficultyLevels,
                builder: (context, state) {
                  return SizedBox(
                    height: 40.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.difficultyLevels.length,
                      itemBuilder: (context, index) {
                        final item = state.difficultyLevels[index];

                        return Padding(
                          padding: EdgeInsets.only(right: 10.w),
                          child: DifficultyWidget(
                            difficultyLevel: item.difficultyLevel,
                            color: item.color,
                            icon: item.icon,
                            iconColor: item.iconColor,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),

              SizedBox(height: 20.h),

              Text(
                "Exercises",
                style: GoogleFonts.inter(
                  fontSize: 23.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 11.h),

              Expanded(
                child: BlocBuilder<WorkoutCubit, WorkoutState>(
                  buildWhen: (p, c) => p.workoutsList != c.workoutsList,
                  builder: (context, state) {
                    if (state.workoutsList.isEmpty) {
                      return const LoadingWidget();
                    }

                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.workoutsList.length,
                      itemBuilder: (context, index) {
                        final workout = state.workoutsList[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: ExercisesWidget(
                            exerciseName: workout.title ?? "",
                            exercisLevel: workout.level ?? "",
                            exerciseImage: workout.url ?? "",
                            exerciseType: workout.type ?? "",
                            workoutId: workout.key ?? "",
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
