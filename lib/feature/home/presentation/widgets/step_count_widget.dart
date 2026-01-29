import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StepCountWidget extends StatelessWidget {
  final int stepCount;
  const StepCountWidget({super.key, required this.stepCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 374.w,
      height: 180.h,
      decoration: BoxDecoration(
        color: Color(0xFFDDF2FF),
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withOpacity(0.05),
            blurRadius: 10.r,
            offset: Offset(0, 10.r),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 28, left: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today's\nStep",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.nunito(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF2B2B2B),
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  stepCount.toString(),
                  textAlign: TextAlign.start,
                  style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFB0B0B0),
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Start: ${DateTime.now().toString().split(" ")[0]}",
                  style: GoogleFonts.inter(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFB0B0B0),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 25.w),
          Center(child: SvgPicture.asset("assets/icons/ic_walking.svg")),
        ],
      ),
    );
  }
}
