import 'package:fitnessai/feature/AI/presentation/cubit/detect_cubit.dart';
import 'package:fitnessai/feature/AI/presentation/cubit/detect_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadVideoPage extends StatelessWidget {
  const UploadVideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<DetectCubit, DetectState>(
          builder: (context, state) {
            final file = state.video;
            final sizeWidget = file == null
                ? const Text("")
                : FutureBuilder<int>(
                    future: file.length(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Text("");
                      }
                      final bytes = snapshot.data!;
                      final mb = bytes / (1024 * 1024);
                      return Text('${mb.toStringAsFixed(2)} MB');
                    },
                  );

            return Column(
              children: [
                Text(file?.name ?? ""),
                sizeWidget,
                Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        context.read<DetectCubit>().pickVideoFromLibrary();
                      },
                      child: Text("Upload Video"),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
