import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessai/feature/workout/presentation/cubit/workout_cubit.dart';
import 'package:fitnessai/feature/workout/presentation/cubit/workout_state.dart';
import 'package:fitnessai/feature/workout/presentation/widget/difficulty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailWorkoutPage extends StatefulWidget {
  const DetailWorkoutPage({super.key, required this.workoutId});

  final String workoutId;

  @override
  State<DetailWorkoutPage> createState() => _DetailWorkoutPageState();
}

class _DetailWorkoutPageState extends State<DetailWorkoutPage> {
  late WorkoutCubit workoutCubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    workoutCubit = context.read<WorkoutCubit>();
    workoutCubit.getWorkoutById(widget.workoutId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Detail Workout",
          style: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<WorkoutCubit, WorkoutState>(
        builder: (context, state) {
          final workout = state.detailWorkout;
          final imageUrl = workout?.url ?? '';
          return Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                child: imageUrl.isEmpty
                    ? const ColoredBox(color: Colors.black12)
                    : CachedNetworkImage(
                        imageUrl: imageUrl,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(
                            color: Colors.redAccent,
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
              ),

              DraggableScrollableSheet(
                initialChildSize: 0.65,
                minChildSize: 0.65,
                maxChildSize: 0.9,
                builder: (context, scrollController) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 19.w, top: 32.h),
                          child: Row(
                            children: [
                              Text(
                                workout?.title ?? '',
                                style: GoogleFonts.inter(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              DifficultyWidget(
                                difficultyLevel: workout?.level ?? '',
                                color: Colors.red,
                                icon: Icons.star,
                                iconColor: Colors.red,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 19.w),
                          child: Text(
                            workout?.desc ?? '',
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFC4C4C4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              if (state.isLoadingDetail)
                const Center(
                  child: CircularProgressIndicator(color: Colors.redAccent),
                ),
            ],
          );
        },
      ),
    );
  }
}
