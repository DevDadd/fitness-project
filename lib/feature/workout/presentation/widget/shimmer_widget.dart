import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerThreeLines extends StatelessWidget {
  const ShimmerThreeLines({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 169, 169, 169),
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _line(width: 180.w),
          SizedBox(height: 15.h),
          _line(width: 180.w),
          SizedBox(height: 15.h),
          _line(width: double.infinity),
        ],
      ),
    );
  }

  Widget _line({required double width}) {
    return Container(
      height: 20.h,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
      ),
    );
  }
}

class ShimmerSingleLine extends StatelessWidget {
  const ShimmerSingleLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 169, 169, 169),
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 20.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.r),
        ),
      ),
    );
  }
}

class ShimmerSinglePicture extends StatelessWidget {
  const ShimmerSinglePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 217, 217, 217),
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.r),
        ),
      ),
    );
  }
}

class ShimmerExerciseImage extends StatelessWidget {
  const ShimmerExerciseImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 169, 169, 169),
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 68.w,
        height: 68.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
    );
  }
}

class ShimmerDifficultyChip extends StatelessWidget {
  const ShimmerDifficultyChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 169, 169, 169),
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 72.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.r),
        ),
      ),
    );
  }
}

class ShimmerWorkOutList extends StatelessWidget {
  const ShimmerWorkOutList({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 169, 169, 169),
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: double.infinity,
        child: Row(
          children: [
            Container(
              width: 68.w,
              height: 68.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
            SizedBox(width: 21.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _line2(width: 160.w, height: 16.h),
                  SizedBox(height: 8.h),
                  _line2(width: 120.w, height: 13.h),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(width: 24.w, height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _line2({required double width, required double height}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
      ),
    );
  }
}
