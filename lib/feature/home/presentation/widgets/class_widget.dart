import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassWidget extends StatelessWidget {
  final String classTitle;
  final String classDescription;
  final String classImage;
  ClassWidget({
    super.key,
    required this.classTitle,
    required this.classDescription,
    required this.classImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.h,
      decoration: BoxDecoration(
        color: Color(0xFFF1F3FA),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 6.w),
            child: Container(
              width: 101.w,
              height: 68.h,
              decoration: BoxDecoration(
                color: Color(0xFFDDF2FF),
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                classTitle,
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF003A4D),
                ),
              ),
              Text(
                classDescription,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF004D66),
                ),
              ),
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Container(
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10.r,
                    offset: Offset(0, 8.h),
                  ),
                ],
              ),
              child: Icon(
                FontAwesomeIcons.heart,
                size: 20.sp,
                color: Color(0xFF0074B9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
