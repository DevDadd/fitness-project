import 'package:dio/dio.dart';
import 'package:fitnessai/feature/AI/data/model/analyze_exercises_request.dart';
import 'package:fitnessai/feature/AI/data/model/detect_model.dart';
import 'package:fitnessai/feature/AI/data/model/status_model.dart';
import 'package:retrofit/retrofit.dart';

part 'detect_service.g.dart';

@RestApi(baseUrl: "https://fitness-backend-buax.onrender.com")
abstract class DetectService {
  factory DetectService(Dio dio, {String baseUrl}) = _DetectService;

  @POST("/api/analysis/upload/")
  Future<DetectModel> detect(@Body() AnalyzeExerciseRequest videoUrl);

  @GET('/analysis/{job_id}/status/')
  Future<StatusModel> getAnalysisStatus(@Path('job_id') String jobId);
}
