import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:fitnessai/feature/courses/domain/usecase/courses_usecase.dart';
import 'package:fitnessai/feature/courses/presentation/cubit/courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit(this.coursesUsecase) : super(const CoursesState());

  final CoursesUsecase coursesUsecase;

  Future<void> getCourses() async {
    try {
      final response = await coursesUsecase.getCourses();
      emit(state.copyWith(courses: response));
    } catch (error, stackTrace) {
      developer.log(
        'Failed to fetch courses',
        name: 'courses.cubit',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}
