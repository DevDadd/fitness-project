import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessai/feature/workout/presentation/controller/detail_workout_controller.dart';
import 'package:fitnessai/feature/workout/presentation/pages/detail_workout_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ExercisesWidget extends StatelessWidget {
  final String exerciseName;
  final String exercisLevel;
  final String exerciseImage;
  final String exerciseType;
  final String workoutId;
  const ExercisesWidget({
    super.key,
    required this.exerciseName,
    required this.exercisLevel,
    required this.exerciseImage,
    required this.exerciseType,
    required this.workoutId,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 68.h,
          width: 68.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: Colors.transparent,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: CachedNetworkImage(
              imageUrl: exerciseImage,
              fit: BoxFit.cover,
              memCacheHeight: 200,
              memCacheWidth: 200,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(color: Colors.redAccent),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ),

        SizedBox(width: 21.w),

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exerciseName,
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                exercisLevel,
                style: GoogleFonts.inter(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFC4C4C4),
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              CupertinoSheetRoute(
                builder: (context) =>
                    DetailWorkoutController(workoutId: workoutId),
              ),
            );
          },
          icon: Icon(FontAwesomeIcons.arrowRight),
        ),
      ],
    );
  }
}
