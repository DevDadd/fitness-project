import 'package:fitnessai/feature/home/search/presentation/cubit/search_cubit.dart';
import 'package:fitnessai/feature/home/search/presentation/cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SuggestionDropdown extends StatelessWidget {
  const SuggestionDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is! SearchLoaded || state.workouts.isEmpty) {
          return const SizedBox.shrink();
        }

        final suggestions = state.workouts;

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          constraints: BoxConstraints(maxHeight: 200.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ListView.separated(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            shrinkWrap: true,
            itemCount: suggestions.length,
            itemBuilder: (context, index) {
              final workout = suggestions[index];
              return ListTile(
                dense: true,
                title: Text(
                  workout.title ?? '',
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: workout.type != null
                    ? Text(
                        workout.type!,
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          color: const Color(0xFF8C8C8C),
                        ),
                      )
                    : null,
                onTap: () {
                  // TODO: handle navigate / fill textfield if needed
                },
              );
            },
            separatorBuilder: (_, __) => Divider(
              height: 1,
              color: const Color(0xFFE0E0E0),
            ),
          ),
        );
      },
    );
  }
}