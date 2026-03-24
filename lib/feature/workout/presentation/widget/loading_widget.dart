import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 250.h,
            width: 250.w,
            child: SvgPicture.asset(
              "assets/images/loading.svg",
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            "Data is loading... Please wait...\n This may take a few seconds.",
            style: GoogleFonts.manrope(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFFC4C4C4),
            ),
          ),
        ],
      ),
    );
  }
}
