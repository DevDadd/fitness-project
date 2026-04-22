import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StepCardWidget extends StatelessWidget {
  const StepCardWidget({
    super.key,
    required this.stepTitle,
    required this.stepNumber,
    required this.stepDescription,
  });
  final int stepNumber;
  final String stepTitle;
  final String stepDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 35.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: const Color.fromARGB(234, 255, 40, 62).withOpacity(0.2),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Text(
            "Step $stepNumber",
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: const Color.fromARGB(255, 247, 36, 36),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          stepTitle,
          style: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8.h),
          Text(
            stepDescription,
            softWrap: true,
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
      ],
    );
  }
}
