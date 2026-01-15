import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'localize_state.dart';

class LocalizeCubit extends Cubit<LocalizeState> {
  LocalizeCubit() : super(LocalizeInitial());
}
