import 'package:fitnessai/feature/workout/presentation/cubit/workout_cubit.dart';
import 'package:fitnessai/feature/workout/presentation/cubit/workout_state.dart';
import 'package:fitnessai/feature/workout/presentation/widget/difficulty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutlistPage extends StatefulWidget {
  const WorkoutlistPage({super.key});

  @override
  State<WorkoutlistPage> createState() => _WorkoutlistPageState();
}

class _WorkoutlistPageState extends State<WorkoutlistPage> {
  @override
  void initState() {
    super.initState();
    // context.read<WorkoutCubit>().getWorkouts();
    context.read<WorkoutCubit>().getDifficultyLevels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
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
                "Browse the workout list to find exercises that match your fitness level and goals.",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFC4C4C4),
                ),
              ),
              SizedBox(height: 20.h),
              BlocBuilder<WorkoutCubit, WorkoutState>(
                buildWhen: (p,c) => p.difficultyLevels != c.difficultyLevels,
                builder: (context, state) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.difficultyLevels.length,
                      itemBuilder: (context, index) {
                        return DifficultyWidget(
                          difficultyLevel: state.difficultyLevels[index],
                          color: const Color.fromARGB(255, 145, 237, 155),
                          icon: Icons.lock_clock,
                          iconColor: const Color(0xFF00994D),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
