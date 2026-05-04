import 'package:fitnessai/feature/courses/domain/entity/courses_entity.dart';

abstract class CoursesRepository {
  Future<List<CoursesEntity>> getCourses();
}
