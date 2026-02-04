import 'package:fitnessai/di.dart';
import 'package:fitnessai/feature/core/localization/cubit/localize_cubit.dart';
import 'package:fitnessai/feature/home/presentation/cubit/core_cubit.dart';
import 'package:fitnessai/home_page_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageCoreProvider extends StatelessWidget {
  const HomePageCoreProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final CoreCubit coreCubit = getIt.get();
    final LocalizeCubit localizeCubit = getIt.get();
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: coreCubit),
        BlocProvider.value(value: localizeCubit),
      ],
      child: const HomePageCore(),
    );
  }
}
