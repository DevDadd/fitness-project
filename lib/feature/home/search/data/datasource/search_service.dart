import 'package:dio/dio.dart';
import 'package:fitnessai/feature/workout/data/model/workout_model.dart';
import 'package:retrofit/retrofit.dart';

part 'search_service.g.dart';

@RestApi(baseUrl: 'https://fitness-backend-buax.onrender.com')
abstract class SearchService {
  factory SearchService(Dio dio, {String? baseUrl}) = _SearchService;

  @GET('/api/exercises/search')
  Future<List<WorkoutModel>> search(@Query('name') String name);
}