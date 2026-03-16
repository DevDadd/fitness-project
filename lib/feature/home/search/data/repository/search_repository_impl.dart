import 'package:fitnessai/feature/home/search/data/datasource/search_service.dart';
import 'package:fitnessai/feature/home/search/domain/repository/search_repository.dart';
import 'package:fitnessai/feature/workout/data/model/workout_model.dart';
import 'package:fitnessai/feature/workout/domain/entity/workout.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchService searchService;
  SearchRepositoryImpl(this.searchService);

  @override
  Future<List<Workout>> searchWorkouts(String name) async {
    final response = await searchService.search(name);
    return response.map((model) => model.toEntity()).toList();
  }
}