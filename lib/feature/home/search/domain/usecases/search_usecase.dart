import 'package:fitnessai/feature/home/search/domain/repository/search_repository.dart';
import 'package:fitnessai/feature/workout/domain/entity/workout.dart';

class SearchUsecase {
  final SearchRepository searchRepository;
  SearchUsecase(this.searchRepository);

  Future<List<Workout>> call(String name) async {
    return await searchRepository.searchWorkouts(name);
  }
}