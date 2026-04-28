import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeSettingCardWidget extends StatelessWidget {
  const ChangeSettingCardWidget({
    super.key,
    required this.title,
    required this.iconPath,
    required this.title2,
    required this.iconPath2,
    this.onArrowTap,
    this.onArrowTap2,
  });
  final String title;
  final String iconPath;
  final String title2;
  final String iconPath2;
  final void Function(BuildContext arrowContext)? onArrowTap;
  final void Function(BuildContext arrowContext)? onArrowTap2;

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
                  Builder(
                    builder: (arrowContext) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: onArrowTap == null
                            ? null
                            : () => onArrowTap!(arrowContext),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 4.h,
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
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
                  Builder(
                    builder: (arrowContext) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: onArrowTap2 == null
                            ? null
                            : () => onArrowTap2!(arrowContext),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 4.h,
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
