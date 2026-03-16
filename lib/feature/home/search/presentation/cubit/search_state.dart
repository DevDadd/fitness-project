
import 'package:equatable/equatable.dart';
import 'package:fitnessai/feature/workout/domain/entity/workout.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {
  const SearchInitial();
}

class SearchLoading extends SearchState {
  const SearchLoading();
}

class SearchLoaded extends SearchState {
  const SearchLoaded(this.workouts);

  final List<Workout> workouts;

  @override
  List<Object?> get props => [workouts];
}

class SearchError extends SearchState {
  const SearchError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}

