import 'package:fitnessai/di.dart';
import 'package:fitnessai/feature/AI/presentation/cubit/detect_cubit.dart';
import 'package:fitnessai/feature/AI/presentation/pages/upload_video_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadVideoController extends StatelessWidget {
  const UploadVideoController({super.key});

  @override
  Widget build(BuildContext context) {
    final DetectCubit detectCubit = getIt.get();
    return BlocProvider.value(
      value: detectCubit,
      child: const UploadVideoPage(),
    );
  }
}
