import 'package:fitnessai/feature/map_drawing/presentation/cubit/mapdraw_cubit.dart';
import 'package:fitnessai/feature/map_drawing/presentation/cubit/mapdraw_state.dart';
import 'package:fitnessai/feature/map_drawing/presentation/pages/controls.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MapDrawingPage extends StatefulWidget {
  const MapDrawingPage({super.key});

  @override
  State<MapDrawingPage> createState() => _MapDrawingPageState();
}

class _MapDrawingPageState extends State<MapDrawingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MapdrawCubit>().getCurrentLocation();
    context.read<MapdrawCubit>().loadDemoRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Route Map",
          style: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: BlocBuilder<MapdrawCubit, MapdrawState>(
        builder: (context, state) {
          if (state.currentLocation == null) {
            return const Center(child: CircularProgressIndicator());
          }

          final center = state.paths.isNotEmpty
              ? state.paths.last
              : state.currentLocation!;
          return FlutterMap(
            options: MapOptions(initialCenter: center, initialZoom: 15),
            children: [
              TileLayer(
                urlTemplate:
                    'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png',
                subdomains: const ['a', 'b', 'c', 'd'],
                userAgentPackageName: 'com.example.mapping',
              ),
              if (state.paths.length >= 2)
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: state.paths,
                      strokeWidth: 5,
                      color: Colors.blue,
                    ),
                  ],
                ),
              if (state.paths.isNotEmpty || state.currentLocation != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: state.paths.isNotEmpty
                          ? state.paths.last
                          : state.currentLocation!,
                      width: 40.w,
                      height: 40.h,
                      child: const Icon(
                        Icons.location_pin,
                        color: Colors.red,
                        size: 40,
                      ),
                    ),
                  ],
                ),
            ],
          );
        },
      ),
      floatingActionButton: Controls(),
    );
  }
}
