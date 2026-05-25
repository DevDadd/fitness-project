import 'package:fitnessai/feature/AI/data/datasource/detect_service.dart';
import 'package:fitnessai/feature/AI/data/model/analyze_exercises_request.dart';
import 'package:fitnessai/feature/AI/data/model/detect_model.dart';
import 'package:fitnessai/feature/AI/domain/repository/detect_repository.dart';

class DetectRepositoryImpl implements DetectRepository {
  final DetectService _detectService;

  DetectRepositoryImpl(this._detectService);

  @override
  Future<DetectModel> detect(
    String videoUrl,
    String exercise,
    String mode,
    String userId,
  ) async {
    try {
      final response = await _detectService.detect(
        AnalyzeExerciseRequest(
          videoUrl: videoUrl,
          exercise: exercise,
          mode: mode,
          userId: userId,
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
