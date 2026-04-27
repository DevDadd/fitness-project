import 'package:fitnessai/di.dart';
import 'package:fitnessai/feature/authentication/cubit/authentication_cubit.dart';
import 'package:fitnessai/feature/core/localization/cubit/localize_cubit.dart';
import 'package:fitnessai/feature/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePageController extends StatelessWidget {
  const ProfilePageController({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthenticationCubit authenticationCubit = getIt.get();
    final LocalizeCubit localizeCubit = getIt.get();
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: authenticationCubit),
        BlocProvider.value(value: localizeCubit),
      ],
      child: const ProfilePage(),
    );
  }
}
