import 'package:fitnessai/di.dart';
import 'package:fitnessai/feature/authentication/controller/login_controller.dart';
import 'package:fitnessai/feature/authentication/presentation/pages/login_page.dart';
import 'package:fitnessai/feature/core/localization/cubit/localize_cubit.dart';
import 'package:fitnessai/feature/core/localization/cubit/localize_state.dart';
import 'package:fitnessai/feature/workout/presentation/controller/detail_workout_controller.dart';
import 'package:fitnessai/feature/workout/presentation/pages/detail_workout_page.dart';
import 'package:fitnessai/home_page_core_provider.dart';
import 'package:fitnessai/l10n/app_localization.dart';
import 'package:fitnessai/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(
    BlocProvider.value(value: getIt<LocalizeCubit>(), child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizeCubit, LocalizeState>(
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: Size(414, 896),
          minTextAdapt: true,
          splitScreenMode: true,
          child: MaterialApp(
            color: Colors.white,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            locale: Locale(state.currentLanguage.toString()),
            supportedLocales: L10n.all,
            debugShowCheckedModeBanner: false,
            home: LoginController(),
          ),
        );
      },
    );
  }
}
