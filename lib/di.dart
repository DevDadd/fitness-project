import 'package:dio/dio.dart';
import 'package:fitnessai/feature/workout/data/datasource/workout_service.dart';
import 'package:fitnessai/feature/workout/data/repository/workout_datasource_impl.dart';
import 'package:fitnessai/feature/workout/domain/repository/workout_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:fitnessai/feature/core/localization/cubit/localize_cubit.dart';
import 'package:fitnessai/feature/history/presentation/cubit/activity_cubit.dart';
import 'package:fitnessai/feature/home/presentation/cubit/core_cubit.dart';
import 'package:fitnessai/feature/workout/domain/usecase/workout_usecase.dart';
import 'package:fitnessai/feature/workout/presentation/cubit/workout_cubit.dart';

final getIt = GetIt.instance;

void setup() {

  getIt.registerLazySingleton<Dio>(() => Dio());

  getIt.registerLazySingleton<WorkoutService>(
      () => WorkoutService(getIt<Dio>()));

  getIt.registerLazySingleton<WorkoutRepository>(
      () => WorkoutDatasourceImpl(getIt<WorkoutService>()));

  getIt.registerLazySingleton<WorkoutUsecase>(
      () => WorkoutUsecase(getIt<WorkoutRepository>()));

  getIt.registerSingleton<LocalizeCubit>(LocalizeCubit());
  getIt.registerSingleton<CoreCubit>(CoreCubit());
  getIt.registerSingleton<ActivityCubit>(ActivityCubit());

  getIt.registerFactory<WorkoutCubit>(
      () => WorkoutCubit(getIt<WorkoutUsecase>()));
}