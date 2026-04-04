import 'package:fitnessai/feature/map_drawing/presentation/cubit/mapdraw_cubit.dart';
import 'package:fitnessai/feature/map_drawing/presentation/cubit/mapdraw_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Controls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapdrawCubit, MapdrawState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.white,
              foregroundColor: Colors.redAccent,
              heroTag: "start",
              onPressed: () => context.read<MapdrawCubit>().startTracking(),
              child: const Icon(Icons.play_arrow),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              backgroundColor: Colors.white,
              foregroundColor: Colors.redAccent,
              heroTag: "stop",
              onPressed: () => context.read<MapdrawCubit>().stopTracking(),
              child: const Icon(Icons.stop),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              backgroundColor: Colors.white,
              foregroundColor: Colors.redAccent,
              heroTag: "reset",
              onPressed: () => context.read<MapdrawCubit>().reset(),
              child: const Icon(Icons.refresh),
            ),
          ],
        );
      },
    );
  }
}
