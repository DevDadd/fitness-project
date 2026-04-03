import 'package:fitnessai/feature/history/data/model/chartdata.dart';
import 'package:fitnessai/feature/history/presentation/cubit/activity_cubit.dart';
import 'package:fitnessai/feature/history/presentation/widgets/calender_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late TooltipBehavior _tooltipBehavior;
  late ZoomPanBehavior _zoomPanBehavior;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ActivityCubit>().getCalenderData();
    _zoomPanBehavior = ZoomPanBehavior(enablePanning: true);
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      header: '',
      activationMode: ActivationMode.singleTap,
      format: 'point.y kcal',
      canShowMarker: false,
      color: Colors.white.withOpacity(0.8),
      textStyle: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 15.sp,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now().day;
    final chartData = context.read<ActivityCubit>().generateChartData();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Your Activities",
                    style: GoogleFonts.inter(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 29.h),
              Text(
                "This week",
                style: GoogleFonts.inter(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 38.h),
              SizedBox(
                height: 81.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 12.w),
                      child: CalenderWidget(
                        isSelected:
                            today ==
                            context
                                .read<ActivityCubit>()
                                .state
                                .currentWeek[index]
                                .day,
                        day: context
                            .read<ActivityCubit>()
                            .state
                            .currentWeek[index]
                            .day
                            .toString(),
                        date: DateFormat('EEE').format(
                          context
                              .read<ActivityCubit>()
                              .state
                              .currentWeek[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 29.h),
              Text(
                "3000 kcal",
                style: GoogleFonts.nunito(
                  fontSize: 19.85.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 36.87.h),
              SfCartesianChart(
                zoomPanBehavior: _zoomPanBehavior,
                tooltipBehavior: _tooltipBehavior,
                plotAreaBorderWidth: 0,
                primaryXAxis: CategoryAxis(
                  majorGridLines: const MajorGridLines(width: 0),
                  axisLine: const AxisLine(width: 0),
                  majorTickLines: const MajorTickLines(size: 0),
                ),
                primaryYAxis: NumericAxis(
                  minimum: 0,
                  maximum: 1000,
                  interval: 200,
                  axisLine: const AxisLine(width: 0),
                  majorTickLines: const MajorTickLines(size: 0),
                ),
                series: [
                  AreaSeries<Chartdata, String>(
                    enableTooltip: true,
                    dataSource: chartData,
                    xValueMapper: (Chartdata data, _) => data.date,
                    yValueMapper: (Chartdata data, _) => data.calories,
                    color: const Color.fromARGB(255, 224, 65, 81),
                    borderWidth: 3,
                    borderColor: const Color.fromARGB(255, 224, 65, 81),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color.fromARGB(255, 224, 65, 81).withOpacity(0.4),
                        const Color.fromARGB(
                          255,
                          224,
                          65,
                          81,
                        ).withOpacity(0.05),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
