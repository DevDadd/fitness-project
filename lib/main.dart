import 'package:fitnessai/feature/onboarding/presentation/onboarding_page.dart';
import 'package:fitnessai/l10n/app_localization.dart';
import 'package:fitnessai/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        locale: const Locale('vi'),
        supportedLocales: L10n.all,
        debugShowCheckedModeBanner: false,
        home: OnboardingPage(),
      ),
    );
  }
}
