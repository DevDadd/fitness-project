import 'package:fitnessai/feature/AI/presentation/cubit/detect_cubit.dart';
import 'package:fitnessai/feature/AI/presentation/cubit/detect_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class VideoResultPage extends StatefulWidget {
  const VideoResultPage({
    super.key,
    required this.resultUrl,
    required this.response,
  });

  final String resultUrl;
  final String response;

  @override
  State<VideoResultPage> createState() => _VideoResultPageState();
}

class _VideoResultPageState extends State<VideoResultPage> {
  late DetectCubit detectCubit;
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    detectCubit = context.read<DetectCubit>();

    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.resultUrl));

    _controller.initialize().then((_) {
      setState(() {});
      _controller.play();
    });
    print('VIDEO RESULT PAGE INIT');
    print('resultUrl: ${widget.resultUrl}');
    print('response: ${widget.response}');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Video Result",
          style: GoogleFonts.inter(color: Colors.black),
        ),
      ),
      body: BlocBuilder<DetectCubit, DetectState>(
        builder: (context, state) {
          if (!_controller.value.isInitialized) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              Expanded(
                child: Center(
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: IconButton(
                  iconSize: 50,
                  color: Colors.white,
                  icon: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause_circle
                        : Icons.play_circle,
                  ),
                  onPressed: () {
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    });
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
