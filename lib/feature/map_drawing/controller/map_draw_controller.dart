import 'package:fitnessai/di.dart';
import 'package:fitnessai/feature/map_drawing/presentation/cubit/mapdraw_cubit.dart';
import 'package:fitnessai/feature/map_drawing/presentation/pages/map_drawing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapDrawController extends StatelessWidget {
  const MapDrawController({super.key});

  @override
  Widget build(BuildContext context) {
    final MapdrawCubit mapdrawCubit = getIt.get();
    return BlocProvider.value(
      value: mapdrawCubit,
      child: const MapDrawingPage(),
    );
  }
}
