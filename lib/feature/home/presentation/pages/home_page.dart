import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitnessai/feature/courses/presentation/cubit/courses_cubit.dart';
import 'package:fitnessai/feature/courses/presentation/cubit/courses_state.dart';
import 'package:fitnessai/feature/authentication/cubit/authentication_cubit.dart';
import 'package:fitnessai/feature/authentication/cubit/authentication_state.dart';
import 'package:fitnessai/feature/home/presentation/controller/category_detail_page.dart';
import 'package:fitnessai/feature/home/presentation/controller/course_detail_controller.dart';
import 'package:fitnessai/feature/home/presentation/cubit/core_cubit.dart';
import 'package:fitnessai/feature/home/presentation/cubit/core_state.dart';
import 'package:fitnessai/feature/home/presentation/pages/category_detail_page.dart';
import 'package:fitnessai/feature/home/presentation/widgets/categories_widget.dart';
import 'package:fitnessai/feature/home/presentation/widgets/class_widget.dart';
import 'package:fitnessai/feature/home/presentation/widgets/step_count_widget.dart';
import 'package:fitnessai/feature/home/presentation/widgets/suggestion_dropdown.dart';
import 'package:fitnessai/feature/home/search/presentation/cubit/search_cubit.dart';
import 'package:fitnessai/feature/map_drawing/controller/map_draw_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();

  final List<CategoriesWidget> categories = [
    CategoriesWidget(
      categoryName: "Strength",
      categoryImage: "",
      categoryBgColor: "DDF2FF",
    ),
    CategoriesWidget(
      categoryName: "Endurance",
      categoryImage: "",
      categoryBgColor: "F1F3FA",
    ),
    CategoriesWidget(
      categoryName: "Flexibility",
      categoryImage: "",
      categoryBgColor: "FFE6D6",
    ),
  ];

  @override
  void initState() {
    super.initState();
    // context.read<CoreCubit>().initPlatformState();
    context.read<CoursesCubit>().getCourses();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      buildWhen: (previous, current) {
        return previous.status != current.status;
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.qr_code_scanner_outlined, size: 25.sp),
            ),
            title: Text(
              "Hello, ${state.loginResponse?.user.userName}",
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                    state.loginResponse?.user.avatar ?? '',
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "Find Your",
                    style: GoogleFonts.inter(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "Workout Class",
                    style: GoogleFonts.inter(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w800,
                      color: const Color.fromARGB(255, 233, 89, 89),
                    ),
                  ),
                ),

                SizedBox(height: 16.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 12.w),
                            SvgPicture.asset(
                              "assets/icons/ic_search.svg",
                              color: Colors.black,
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  context.read<SearchCubit>().search(value);
                                },
                                controller: searchController,
                                cursorColor: const Color(0xFFE04151),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search",
                                  hintStyle: GoogleFonts.inter(
                                    fontSize: 16.sp,
                                    color: const Color(0xFFC4C4C4),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 6.h),
                      const SuggestionDropdown(),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Text(
                        "Suggest for you",
                        style: GoogleFonts.inter(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "See all",
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFE04151),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10.h),

                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MapDrawController(),
                        ),
                      );
                    },
                    child: ClassWidget(
                      classTitle: "Track your running",
                      classDescription: "Drawing line for your running",
                      classImage: "assets/images/map_image.jpg",
                      isRequiredFavorite: false,
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "Track your steps today",
                    style: GoogleFonts.inter(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                SizedBox(height: 10.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: BlocBuilder<CoreCubit, CoreState>(
                    buildWhen: (prev, curr) =>
                        prev.todaySteps != curr.todaySteps,
                    builder: (context, state) {
                      return StepCountWidget(
                        stepCount: state.todaySteps ?? 0,
                        startDate: state.timestamp ?? DateTime.now(),
                      );
                    },
                  ),
                ),

                SizedBox(height: 24.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Recommendation Class",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF2B2B2B),
                          ),
                        ),
                      ),
                      Text(
                        "See all",
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 233, 89, 89),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10.h),

                BlocBuilder<CoursesCubit, CoursesState>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                        height: 80.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.courses.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 10.w),
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CourseDetailController(
                                    courseKey: state.courses[index].id,
                                  ),
                                ),
                              );
                            },
                            child: ClassWidget(
                              isCourse: true,
                              classTitle: state.courses[index].title,
                              classDescription:
                                  state.courses[index].description,
                              classImage: state.courses[index].imageUrl,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),

                SizedBox(height: 15.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Categories",
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xFF2B2B2B),
                          ),
                        ),
                      ),
                      Text(
                        "See all",
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromARGB(255, 233, 89, 89),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10.h),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CarouselSlider.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index, realIndex) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CategoryDetailPageController(
                                    categoryType:
                                        categories[index].categoryName,
                                  ),
                            ),
                          );
                        },
                        child: CategoriesWidget(
                          categoryName: categories[index].categoryName,
                          categoryImage: categories[index].categoryImage,
                          categoryBgColor: categories[index].categoryBgColor,
                        ),
                      );
                    },
                    options: CarouselOptions(
                      initialPage: 0,
                      viewportFraction: 0.41,
                      padEnds: false,
                      enableInfiniteScroll: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
