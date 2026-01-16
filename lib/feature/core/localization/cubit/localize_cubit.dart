import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitnessai/feature/core/localization/cubit/localize_state.dart';

class LocalizeCubit extends Cubit<LocalizeState> {
  LocalizeCubit() : super(LocalizeState());
  void setCurrentLanguage(String language) {
    emit(state.copyWith(currentLanguage: language));
  }
}
