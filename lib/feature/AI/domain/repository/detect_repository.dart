import 'package:fitnessai/feature/AI/data/model/detect_model.dart';
import 'package:fitnessai/feature/AI/data/model/status_model.dart';

abstract class DetectRepository {
  Future<DetectModel> detect(
    String videoUrl,
    String exercise,
    String mode,
    String userId,
  );
  Future<StatusModel> getStatus(String jobId);
}
