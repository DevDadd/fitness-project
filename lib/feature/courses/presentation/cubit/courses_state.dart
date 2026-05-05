import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:fitnessai/feature/courses/domain/entity/course_detail_model_entity.dart';
import 'package:fitnessai/feature/courses/domain/entity/courses_entity.dart';

part 'courses_state.g.dart';

@CopyWith()
class CoursesState extends Equatable {
  const CoursesState({this.courses = const [], this.coursesDetail});

  final List<CoursesEntity> courses;
  final CoursesDetailEntity? coursesDetail;

  @override
  List<Object?> get props => [courses, coursesDetail];
}
