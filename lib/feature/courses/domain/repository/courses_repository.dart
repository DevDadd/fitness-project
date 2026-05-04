import 'package:fitnessai/feature/courses/domain/entity/course_detail_model_entity.dart';
import 'package:fitnessai/feature/courses/domain/entity/courses_entity.dart';

abstract class CoursesRepository {
  Future<List<CoursesEntity>> getCourses();
  Future<CoursesDetailEntity> getCoursesDetail(String id);
}
