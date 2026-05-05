import 'package:fitnessai/di.dart';
import 'package:fitnessai/feature/home/presentation/pages/category_detail_page.dart';
import 'package:fitnessai/feature/workout/presentation/cubit/workout_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailPageController extends StatelessWidget {
  const CategoryDetailPageController({super.key, required this.categoryType});
  final String categoryType;

  @override
  Widget build(BuildContext context) {
    final WorkoutCubit workoutCubit = getIt.get();
    return MultiBlocProvider(
      providers: [BlocProvider.value(value: workoutCubit)],
      child: CategoryDetailPage(categoryType: categoryType),
    );
  }
}
