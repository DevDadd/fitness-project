import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FeatureCardWidget extends StatelessWidget {
  const FeatureCardWidget({
    super.key,
    required this.title,
    required this.iconPath,
    required this.title2,
    required this.iconPath2,
  });
  final String title;
  final String iconPath;
  final String title2;
  final String iconPath2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10.r,
              offset: Offset(0, 5.h),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(iconPath, height: 20.h, width: 20.w),
                  SizedBox(width: 10.w),
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14.sp,
                    color: Colors.black,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Divider(color: Colors.grey.withOpacity(0.3), thickness: 1),
              SizedBox(height: 10.h),
              Row(
                children: [
                  SvgPicture.asset(iconPath2, height: 20.h, width: 20.w),
                  SizedBox(width: 10.w),
                  Text(
                    title2,
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14.sp,
                    color: Colors.black,
                  ),
                  Divider(color: Colors.grey.withOpacity(0.5), thickness: 1),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
