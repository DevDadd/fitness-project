import 'package:fitnessai/feature/core/localization/cubit/localize_cubit.dart';
import 'package:fitnessai/feature/home/presentation/cubit/core_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<LocalizeCubit>(LocalizeCubit());
  getIt.registerSingleton<CoreCubit>(CoreCubit());
}
