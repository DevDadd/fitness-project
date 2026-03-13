import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ExercisesWidget extends StatelessWidget {
  final String exerciseName;
  final String exercisLevel;
  final String exerciseImage;
  final String exerciseType;

  const ExercisesWidget({
    super.key,
    required this.exerciseName,
    required this.exercisLevel,
    required this.exerciseImage,
    required this.exerciseType,
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
            color: Colors.red,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.network(
              exerciseImage,
              fit: BoxFit.cover,
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
      ],
    );
  }
}