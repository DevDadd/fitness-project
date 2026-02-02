import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fitnessai/feature/home/presentation/pages/home_page.dart';
import 'package:fitnessai/feature/history/presentation/pages/history_page.dart';
import 'package:fitnessai/feature/workout/presentation/pages/workoutlist_page.dart';
import 'package:fitnessai/feature/setting/presentation/pages/setting_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePageCore extends StatefulWidget {
  const HomePageCore({super.key});

  @override
  State<HomePageCore> createState() => _HomePageCoreState();
}

class _HomePageCoreState extends State<HomePageCore> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    WorkoutlistPage(),
    HistoryPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: const Color.fromARGB(255, 224, 65, 81),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(FontAwesomeIcons.house, size: 25.sp),
            title: Text(
              "Home",
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w700,
                fontSize: 15.sp,
              ),
            ),
          ),
          SalomonBottomBarItem(
            icon: Icon(FontAwesomeIcons.dumbbell, size: 25.sp),
            title: Text(
              "Workout",
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w700,
                fontSize: 15.sp,
              ),
            ),
          ),
          SalomonBottomBarItem(
            icon: Icon(FontAwesomeIcons.clockRotateLeft, size: 25.sp),
            title: Text(
              "History",
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w700,
                fontSize: 15.sp,
              ),
            ),
          ),
          SalomonBottomBarItem(
            icon: Icon(FontAwesomeIcons.gear, size: 25.sp),
            title: Text(
              "Setting",
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w700,
                fontSize: 15.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
