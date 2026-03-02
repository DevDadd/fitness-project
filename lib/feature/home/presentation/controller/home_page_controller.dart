import 'package:fitnessai/di.dart';
import 'package:fitnessai/feature/home/presentation/cubit/core_cubit.dart';
import 'package:fitnessai/feature/home/presentation/pages/home_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageController extends StatelessWidget {
  const HomePageController({super.key});

  @override
  Widget build(BuildContext context) {
    final CoreCubit coreCubit = getIt.get();
    return BlocProvider.value(value: coreCubit, child: const HomePage());
  }
}
