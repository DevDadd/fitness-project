import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/ic_menu.svg"),
        ),
        title: Text(
          "Hello, Username",
          style: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(radius: 20.r, backgroundColor: Colors.red),
          ),
        ],
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              "Find Your",
              style: GoogleFonts.inter(
                fontSize: 22.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Workout Class",
              style: GoogleFonts.inter(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Center(
            child: Container(
              width: 374.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Row(
                children: [
                  SizedBox(width: 16.w),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/icons/ic_search.svg",
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      cursorColor: Color.fromARGB(255, 224, 65, 81),
                      controller: searchController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Search",
                        hintStyle: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFC4C4C4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
