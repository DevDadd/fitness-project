import 'package:fitnessai/feature/courses/domain/entity/courses_entity.dart';
import 'package:fitnessai/feature/courses/domain/repository/courses_repository.dart';

class CoursesUsecase {
  final CoursesRepository coursesRepository;
  CoursesUsecase(this.coursesRepository);

  Future<List<CoursesEntity>> getCourses() async {
    return await coursesRepository.getCourses();
  }
}
