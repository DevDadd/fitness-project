import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StepCountWidget extends StatelessWidget {
  final int stepCount;
  final DateTime startDate;

  const StepCountWidget({
    super.key,
    required this.stepCount,
    required this.startDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // ✅ responsive
      height: 180.h,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFFDDF2FF),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12.r,
            offset: Offset(0, 8.h),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// LEFT TEXT
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today's\nStep",
                    style: GoogleFonts.nunito(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF2B2B2B),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    stepCount.toString(),
                    style: GoogleFonts.inter(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF7A7A7A),
                    ),
                  ),
                  Text(
                    "Start: ${startDate.toString().split(' ')[0]}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: GoogleFonts.inter(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF7A7A7A),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// RIGHT ICON
          SizedBox(width: 12.w),
          SvgPicture.asset("assets/icons/ic_walking.svg"),
        ],
      ),
    );
  }
}
