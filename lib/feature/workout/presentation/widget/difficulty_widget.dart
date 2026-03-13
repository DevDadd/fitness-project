import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DifficultyWidget extends StatelessWidget {
  const DifficultyWidget({
    super.key,
    required this.difficultyLevel,
    required this.color,
    required this.icon,
    required this.iconColor,
  });
  final String difficultyLevel;
  final Color color;
  final Color iconColor;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IntrinsicWidth(
        stepWidth: 10.w,
        child: Container(
          height: 35.h,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: iconColor, size: 16.sp),
              SizedBox(width: 4.w),
              Text(
                difficultyLevel,
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: iconColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
