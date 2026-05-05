import 'package:dio/dio.dart';
import 'package:fitnessai/feature/workout/data/model/workout_model.dart';
import 'package:retrofit/retrofit.dart';

part 'workout_service.g.dart';

@RestApi(baseUrl: "https://fitness-backend-buax.onrender.com")
abstract class WorkoutService {
  factory WorkoutService(Dio dio, {String baseUrl}) = _WorkoutService;

  @GET("/api/exercises")
  Future<List<WorkoutModel>> getWorkouts();

  @GET("/api/exercises/{id}")
  Future<WorkoutModel> getWorkoutById(@Path("id") String id);

  @GET("/api/exercises/type")
  Future<List<WorkoutModel>> getWorkoutsByType(@Query("type") String type);
}
