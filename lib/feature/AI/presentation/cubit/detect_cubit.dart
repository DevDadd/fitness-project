import 'package:bloc/bloc.dart';
import 'package:fitnessai/feature/AI/presentation/cubit/detect_state.dart';
import 'package:fitnessai/feature/AI/presentation/usecase/detect_usecase.dart';
import 'package:image_picker/image_picker.dart';

class DetectCubit extends Cubit<DetectState> {
  final ImagePicker imagePicker = ImagePicker();
  final DetectUsecase detectUsecase;
  DetectCubit({required this.detectUsecase}) : super(DetectState());

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

  Future<void> uploadVideoToSystem(
    String videoUrl,
    String exercise,
    String mode,
    String userId,
  ) async {
    var res = await detectUsecase.detect(videoUrl, exercise, mode, userId);
    emit(state.copyWith(uploadResult: res));
  }

  void clearVideo() {
    emit(DetectState());
  }
}
