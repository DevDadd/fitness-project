import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fitnessai/feature/home/search/domain/usecases/search_usecase.dart';
import 'package:fitnessai/feature/home/search/presentation/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUsecase searchUsecase;
  SearchCubit(this.searchUsecase) : super(const SearchInitial());

  Timer? _debounce;
  int _requestId = 0;

  void search(String name) {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 400), () async {
      final currentRequest = ++_requestId;

      emit(const SearchLoading());

      try {
        final workouts = await searchUsecase.call(name);

        if (currentRequest != _requestId) return;

        emit(SearchLoaded(workouts));
      } catch (e) {
        emit(SearchError(e.toString()));
      }
    });
  }
}
