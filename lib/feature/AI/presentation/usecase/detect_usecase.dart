import 'package:fitnessai/feature/AI/data/model/detect_model.dart';
import 'package:fitnessai/feature/AI/domain/repository/detect_repository.dart';

class DetectUsecase {
  final DetectRepository _detectRepository;

  DetectUsecase(this._detectRepository);

  Future<DetectModel> detect(
    String videoUrl,
    String exercise,
    String mode,
    String userId,
  ) async {
    return await _detectRepository.detect(videoUrl, exercise, mode, userId);
  }
}
