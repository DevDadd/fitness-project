import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fitnessai/feature/AI/data/datasource/upload_r2_service.dart';
import 'package:fitnessai/feature/AI/presentation/cubit/detect_cubit.dart';
import 'package:fitnessai/feature/AI/presentation/cubit/detect_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class UploadVideoPage extends StatefulWidget {
  const UploadVideoPage({super.key});

  @override
  State<UploadVideoPage> createState() => _UploadVideoPageState();
}

class _UploadVideoPageState extends State<UploadVideoPage> {
  final UploadR2Service _uploadR2Service = UploadR2Service();

  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  String? _currentResultUrl;

  @override
  void dispose() {
    _chewieController?.dispose();
    _videoPlayerController?.dispose();
    super.dispose();
  }

  Future<void> _initResultVideo(String resultUrl) async {
    try {
      if (_currentResultUrl == resultUrl) return;

      _currentResultUrl = resultUrl;

      _chewieController?.dispose();
      await _videoPlayerController?.dispose();

      _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(resultUrl),
      );

      await _videoPlayerController!.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        autoPlay: true,
        looping: true,
        allowFullScreen: true,
        allowMuting: true,
        showControls: true,
        materialProgressColors: ChewieProgressColors(
          playedColor: Colors.red,
          handleColor: Colors.red,
          backgroundColor: Colors.grey.shade300,
          bufferedColor: Colors.grey.shade500,
        ),
      );

      if (mounted) {
        setState(() {});
      }

      print('RESULT VIDEO INITIALIZED');
    } catch (e) {
      print('VIDEO INIT ERROR: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DetectCubit, DetectState>(
      listenWhen: (previous, current) =>
          previous.statusResult != current.statusResult,
      listener: (context, state) async {
        print('========== LISTENER ==========');
        print('status: ${state.statusResult?.status}');
        print('resultUrl: ${state.statusResult?.resultUrl}');
        print('==============================');

        final resultUrl = state.statusResult?.resultUrl;

        if (resultUrl == null) return;

        await _initResultVideo(resultUrl);
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: BlocBuilder<DetectCubit, DetectState>(
            builder: (context, state) {
              return Column(
                children: [
                  DottedBorder(
                    options: const RoundedRectDottedBorderOptions(
                      color: Colors.red,
                      strokeWidth: 2,
                      dashPattern: [8, 4],
                      radius: Radius.circular(13),
                    ),
                    child: Container(
                      height: 200.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
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
                                context
                                    .read<DetectCubit>()
                                    .pickVideoFromLibrary();
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
                      if (state.video == null) {
                        return const SizedBox.shrink();
                      }

                      final file = File(state.video!.path);

                      double? fileSizeMb;

                      try {
                        if (file.existsSync()) {
                          fileSizeMb = file.lengthSync() / (1024 * 1024);
                        }
                      } catch (e) {
                        print('FILE SIZE ERROR: $e');
                      }

                      return Container(
                        height: 80.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.video?.name ?? 'No video selected',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.manrope(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 6.h),
                                    Text(
                                      fileSizeMb != null
                                          ? '${fileSizeMb.toStringAsFixed(2)} MB'
                                          : '--',
                                      style: GoogleFonts.manrope(
                                        fontSize: 14.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                height: 40.h,
                                width: 90.w,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: GestureDetector(
                                  onTap: () async {
                                    try {
                                      final videoFile = File(state.video!.path);

                                      if (!videoFile.existsSync()) {
                                        print('VIDEO FILE NOT FOUND');
                                        return;
                                      }

                                      final url = await _uploadR2Service
                                          .uploadFile(videoFile);

                                      await context
                                          .read<DetectCubit>()
                                          .uploadVideoToSystem(
                                            url,
                                            "squat",
                                            "video",
                                            "2",
                                          );
                                    } catch (e) {
                                      print('UPLOAD ERROR: $e');
                                    }
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

                  SizedBox(height: 24.h),

                  if (_chewieController != null)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Result Video',
                            style: GoogleFonts.manrope(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: AspectRatio(
                              aspectRatio:
                                  _videoPlayerController!.value.aspectRatio,
                              child: Chewie(controller: _chewieController!),
                            ),
                          ),
                        ],
                      ),
                    ),
                  SizedBox(height: 20.h),
                  if (state.statusResult?.analysis != null)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Video Summary',
                            style: GoogleFonts.manrope(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),

                          SizedBox(height: 16.h),

                          Text(
                            state.statusResult!.analysis?.overall ?? '',
                            style: GoogleFonts.manrope(
                              fontSize: 14.sp,
                              height: 1.5,
                            ),
                          ),

                          if ((state.statusResult!.analysis?.goodPoints ?? [])
                              .isNotEmpty) ...[
                            SizedBox(height: 20.h),

                            Text(
                              '✅ Good Points',
                              style: GoogleFonts.manrope(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            SizedBox(height: 8.h),

                            ...state.statusResult!.analysis!.goodPoints!.map(
                              (e) => Padding(
                                padding: EdgeInsets.only(bottom: 6.h),
                                child: Text(
                                  '• $e',
                                  style: GoogleFonts.manrope(fontSize: 14.sp),
                                ),
                              ),
                            ),
                          ],
                          if ((state.statusResult!.analysis?.mainIssues ?? [])
                              .isNotEmpty) ...[
                            SizedBox(height: 20.h),

                            Text(
                              '⚠️ Main Issues',
                              style: GoogleFonts.manrope(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            SizedBox(height: 8.h),

                            ...state.statusResult!.analysis!.mainIssues!.map(
                              (e) => Padding(
                                padding: EdgeInsets.only(bottom: 6.h),
                                child: Text(
                                  '• $e',
                                  style: GoogleFonts.manrope(fontSize: 14.sp),
                                ),
                              ),
                            ),
                          ],

                          if ((state.statusResult!.analysis?.advice ?? [])
                              .isNotEmpty) ...[
                            SizedBox(height: 20.h),

                            Text(
                              '💡 Advice',
                              style: GoogleFonts.manrope(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            SizedBox(height: 8.h),

                            ...state.statusResult!.analysis!.advice!.map(
                              (e) => Padding(
                                padding: EdgeInsets.only(bottom: 6.h),
                                child: Text(
                                  '• $e',
                                  style: GoogleFonts.manrope(fontSize: 14.sp),
                                ),
                              ),
                            ),
                          ],

                          if (state.statusResult!.analysis?.stats != null) ...[
                            SizedBox(height: 20.h),

                            Text(
                              '📊 Statistics',
                              style: GoogleFonts.manrope(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            SizedBox(height: 8.h),

                            Text(
                              'Exercise: ${state.statusResult!.analysis!.stats?['exercise'] ?? '-'}',
                            ),
                            Text(
                              'Total Reps: ${state.statusResult!.analysis!.stats?['total_reps'] ?? 0}',
                            ),
                            Text(
                              'Correct Reps: ${state.statusResult!.analysis!.stats?['correct_reps'] ?? 0}',
                            ),
                            Text(
                              'Accuracy: ${state.statusResult!.analysis!.stats?['accuracy_percent'] ?? 0}%',
                            ),
                            Text(
                              'Avg Rep Time: ${state.statusResult!.analysis!.stats?['avg_rep_time_sec'] ?? 0}s',
                            ),
                          ],
                        ],
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
