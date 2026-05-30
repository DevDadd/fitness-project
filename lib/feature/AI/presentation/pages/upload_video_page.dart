import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:fitnessai/feature/AI/data/datasource/upload_r2_service.dart';
import 'package:fitnessai/feature/AI/presentation/cubit/detect_cubit.dart';
import 'package:fitnessai/feature/AI/presentation/cubit/detect_state.dart';
import 'package:fitnessai/feature/AI/presentation/pages/video_result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadVideoPage extends StatefulWidget {
  const UploadVideoPage({super.key});

  @override
  State<UploadVideoPage> createState() => _UploadVideoPageState();
}

class _UploadVideoPageState extends State<UploadVideoPage> {
  final UploadR2Service _uploadR2Service = UploadR2Service();
  @override
  Widget build(BuildContext context) {
    return BlocListener<DetectCubit, DetectState>(
      listenWhen: (previous, current) =>
          previous.statusResult != current.statusResult,
      listener: (context, state) {
        // TODO: implement listener
        if (state.statusResult?.resultUrl != null) {
          Navigator.push(
            context,
            CupertinoSheetRoute(builder: (context) => VideoResultPage()),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Upload Video",
            style: GoogleFonts.manrope(
              fontWeight: FontWeight.w500,
              fontSize: 22.sp,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DottedBorder(
                options: const RoundedRectDottedBorderOptions(
                  color: Colors.red,
                  strokeWidth: 2,
                  dashPattern: [8, 4],
                  radius: Radius.circular(13.0),
                ),
                child: Container(
                  height: 200.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/ic_upload.svg",
                          height: 50.h,
                          width: 50.w,
                          colorFilter: const ColorFilter.mode(
                            Colors.red,
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        GestureDetector(
                          onTap: () {
                            context.read<DetectCubit>().pickVideoFromLibrary();
                          },
                          child: Text(
                            "Choose video from your device",
                            style: GoogleFonts.manrope(
                              fontWeight: FontWeight.w700,
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              BlocBuilder<DetectCubit, DetectState>(
                builder: (context, state) {
                  double? fileSizeMb;

                  if (state.video != null) {
                    fileSizeMb =
                        File(state.video!.path).lengthSync() / (1024 * 1024);
                  }
                  if (state.video == null) {
                    return Container();
                  }
                  return Container(
                    height: 80.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.video?.name ?? "No video selected",
                                style: GoogleFonts.manrope(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                state.video != null
                                    ? '${fileSizeMb!.toStringAsFixed(2)} MB'
                                    : '--',
                                style: GoogleFonts.manrope(
                                  fontSize: 14.sp,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            height: 40.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                _uploadR2Service
                                    .uploadFile(File(state.video!.path))
                                    .then((res) {
                                      context
                                          .read<DetectCubit>()
                                          .uploadVideoToSystem(
                                            res,
                                            "squat",
                                            "video",
                                            "2",
                                          );
                                    });
                              },
                              child: Center(
                                child: Text(
                                  "Upload",
                                  style: GoogleFonts.manrope(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
