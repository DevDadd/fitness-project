import 'package:fitnessai/feature/courses/domain/entity/course_detail_model_entity.dart';
import 'package:fitnessai/feature/courses/domain/entity/courses_entity.dart';
import 'package:fitnessai/feature/courses/domain/repository/courses_repository.dart';

class CoursesUsecase {
  final CoursesRepository coursesRepository;
  CoursesUsecase(this.coursesRepository);

  Future<List<CoursesEntity>> getCourses() async {
    return await coursesRepository.getCourses();
  }

  Future<CoursesDetailEntity> getCoursesDetail(String id) async {
    return await coursesRepository.getCoursesDetail(id);
  }
}
