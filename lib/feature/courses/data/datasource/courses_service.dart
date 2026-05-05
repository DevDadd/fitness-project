import 'package:dio/dio.dart';
import 'package:fitnessai/feature/courses/data/model/courses_detail_model.dart';
import 'package:fitnessai/feature/courses/data/model/courses_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'courses_service.g.dart';

@RestApi(baseUrl: 'https://fitness-backend-buax.onrender.com')
abstract class CoursesService {
  factory CoursesService(Dio dio, {String? baseUrl}) = _CoursesService;

  @GET('/api/courses')
  Future<List<CoursesModel>> getCourses();

  @GET('/api/courses/{id}')
  Future<CoursesDetailModel> getCourse(@Path('id') String id);
}
