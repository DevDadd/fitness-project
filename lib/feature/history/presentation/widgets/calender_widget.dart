import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({
    super.key,
    this.isSelected = false,
    required this.day,
    required this.date,
  });
  final bool isSelected;
  final String day;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68.w,
      height: 80.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: isSelected
            ? const Color.fromARGB(255, 224, 65, 81)
            : Color(0xFFF1F3FA),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date,
            style: GoogleFonts.nunito(
              fontSize: 13.4.sp,
              color: isSelected ? Colors.white : Color(0xFF9FA2AE),
            ),
          ),
          SizedBox(height: 3.h),
          Text(
            day,
            style: GoogleFonts.nunito(
              fontSize: 19.85.sp,
              fontWeight: FontWeight.w900,
              color: isSelected ? Colors.white : Color(0xFF2B2B2B),
            ),
          ),
        ],
      ),
    );
  }
}
