import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesWidget extends StatelessWidget {
  final String categoryName;
  final String categoryImage;
  final String categoryBgColor;
  const CategoriesWidget({
    super.key,
    required this.categoryName,
    required this.categoryImage,
    required this.categoryBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 236.h,
      width: 142.w,
      decoration: BoxDecoration(
        color: Color(int.parse('0xFF$categoryBgColor')),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          SizedBox(height: 15.h),
          Text(
            categoryName,
            style: GoogleFonts.nunito(
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
              color: Color(0xFF2B2B2B),
            ),
          ),
        ],
      ),
    );
  }
}
