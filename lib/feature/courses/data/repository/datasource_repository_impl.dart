import 'package:fitnessai/feature/courses/data/datasource/courses_service.dart';
import 'package:fitnessai/feature/courses/data/model/courses_detail_model.dart';
import 'package:fitnessai/feature/courses/data/model/courses_model.dart';
import 'package:fitnessai/feature/courses/domain/entity/course_detail_model_entity.dart';
import 'package:fitnessai/feature/courses/domain/entity/courses_entity.dart';
import 'package:fitnessai/feature/courses/domain/repository/courses_repository.dart';

class CoursesRepositoryImpl implements CoursesRepository {
  final CoursesService coursesService;
  CoursesRepositoryImpl(this.coursesService);

  @override
  Future<List<CoursesEntity>> getCourses() async {
    final response = await coursesService.getCourses();
    return response.map((model) => model.toEntity()).toList();
  }

  @override
  Future<CoursesDetailEntity> getCoursesDetail(String id) async {
    final response = await coursesService.getCourse(id);
    return response.toEntity();
  }
}
