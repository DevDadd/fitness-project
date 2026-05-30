import 'package:flutter/material.dart';

class VideoResultPage extends StatelessWidget {
  const VideoResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Video Result')),
      body: Center(child: Text('Display video analysis results here')),
    );
  }
}
