import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:fitnessai/feature/AI/presentation/cubit/detect_state.dart';
import 'package:image_picker/image_picker.dart';

class DetectCubit extends Cubit<DetectState> {
  final ImagePicker imagePicker = ImagePicker();

  DetectCubit() : super(DetectState());

  Future<void> pickVideoFromLibrary() async {
    try {
      final XFile? pickedVideo = await imagePicker.pickVideo(
        source: ImageSource.gallery,
      );

      if (pickedVideo != null) {
        emit(state.copyWith(video: pickedVideo));
      }
    } catch (e) {
      print('Pick video error: $e');
    }
  }
}
