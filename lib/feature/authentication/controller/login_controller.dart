import 'package:fitnessai/di.dart';
import 'package:fitnessai/feature/authentication/cubit/authentication_cubit.dart';
import 'package:fitnessai/feature/authentication/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginController extends StatelessWidget {
  const LoginController({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthenticationCubit authenticationCubit = getIt.get();
    return BlocProvider.value(
      value: authenticationCubit,
      child: const LoginPage(),
    );
  }
}
