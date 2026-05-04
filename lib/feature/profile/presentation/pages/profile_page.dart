import 'package:fitnessai/feature/authentication/controller/login_controller.dart';
import 'package:fitnessai/feature/authentication/cubit/authentication_cubit.dart';
import 'package:fitnessai/feature/authentication/cubit/authentication_state.dart';
import 'package:fitnessai/feature/core/localization/cubit/localize_cubit.dart';
import 'package:fitnessai/feature/core/localization/cubit/localize_state.dart';
import 'package:fitnessai/feature/profile/presentation/widgets/change_setting_card_widget.dart';
import 'package:fitnessai/feature/profile/presentation/widgets/feature_card_widget.dart';
import 'package:fitnessai/feature/profile/presentation/widgets/info_card_widget.dart';
import 'package:fitnessai/feature/profile/presentation/widgets/notification_bottom_sheet.dart';
import 'package:fitnessai/l10n/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popover/popover.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      // backgroundColor: Colors.white,
      body: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        buildWhen: (previous, current) =>
            previous.loginResponse != current.loginResponse,
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 20,
                      ),
                      child: Text(
                        "My Profile",
                        style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Container(
                      height: 160.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(color: Colors.red, width: 3.w),
                      ),
                      child: Icon(
                        Icons.person,
                        size: 100.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        state.loginResponse?.user.userName ?? '',
                        style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: Colors.green, width: 1.w),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 5.w,
                                top: 5.h,
                                bottom: 5.h,
                                right: 5.w,
                              ),
                              child: Text(
                                "Verified",
                                style: GoogleFonts.inter(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromARGB(255, 29, 109, 23),
                                ),
                              ),
                            ),
                            Container(
                              width: 10.w,
                              height: 10.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(width: 3.w),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                InfoCardWidget(
                  title: "Email",
                  description: state.loginResponse?.user.email ?? '',
                  genderTitle: "Gender",
                  genderDescription: state.loginResponse?.user.gender ?? '',
                ),
                SizedBox(height: 8.h),
                FeatureCardWidget(
                  title: "Upload Video",
                  iconPath: "assets/icons/ic_upload.svg",
                  title2: "Stream Video",
                  iconPath2: "assets/icons/ic_camera.svg",
                ),
                SizedBox(height: 8.h),
                ChangeSettingCardWidget(
                  title: "Change Language",
                  iconPath: "assets/icons/ic_language.svg",
                  title2: "Change Theme",
                  iconPath2: "assets/icons/ic_theme.svg",
                  onArrowTap: (arrowContext) {
                    showPopover(
                      context: arrowContext,
                      bodyBuilder: (_) =>
                          BlocBuilder<LocalizeCubit, LocalizeState>(
                            builder: (context, localizeState) {
                              final appLocalizations = AppLocalizations.of(
                                context,
                              )!;
                              final currentLanguage =
                                  localizeState.currentLanguage ?? 'vi';
                              return Material(
                                color: Colors.white,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<LocalizeCubit>()
                                            .setCurrentLanguage('vi');
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 16.w,
                                          vertical: 12.h,
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                appLocalizations.languagevn,
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                            ),
                                            if (currentLanguage == 'vi')
                                              Icon(Icons.check, size: 16.sp),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        context
                                            .read<LocalizeCubit>()
                                            .setCurrentLanguage('en');
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 16.w,
                                          vertical: 12.h,
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                appLocalizations.languageuk,
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                ),
                                              ),
                                            ),
                                            if (currentLanguage == 'en')
                                              Icon(Icons.check, size: 16.sp),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                      direction: PopoverDirection.bottom,
                      width: 250.w,
                      height: 92.h,
                      arrowHeight: 10.h,
                      arrowWidth: 20.w,
                    );
                  },
                  onArrowTap2: (arrowContext) {
                    showPopover(
                      context: arrowContext,
                      bodyBuilder: (_) =>
                          BlocBuilder<LocalizeCubit, LocalizeState>(
                            builder: (context, localizeState) {
                              final isDarkMode =
                                  localizeState.isDarkMode ?? false;
                              return Material(
                                color: Colors.white,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (isDarkMode) {
                                          context
                                              .read<LocalizeCubit>()
                                              .setIsDarkMode();
                                        }
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 16.w,
                                          vertical: 12.h,
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/ic_theme.svg',
                                                    width: 20.w,
                                                    height: 20.h,
                                                  ),
                                                  SizedBox(width: 10.w),
                                                  Text(
                                                    'Light',
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (!isDarkMode)
                                              Icon(Icons.check, size: 16.sp),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (!isDarkMode) {
                                          context
                                              .read<LocalizeCubit>()
                                              .setIsDarkMode();
                                        }
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 16.w,
                                          vertical: 12.h,
                                        ),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/ic_moon.svg',
                                                    width: 20.w,
                                                    height: 20.h,
                                                  ),
                                                  SizedBox(width: 10.w),
                                                  Text(
                                                    'Dark',
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (isDarkMode)
                                              Icon(Icons.check, size: 16.sp),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                      direction: PopoverDirection.bottom,
                      width: 250.w,
                      height: 94.h,
                      arrowHeight: 10.h,
                      arrowWidth: 20.w,
                    );
                  },
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 10.h,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      showDialog<void>(
                        context: context,
                        builder: (dialogContext) => NotificationBottomSheet(
                          onConfirm: () {
                            final navigator = Navigator.of(
                              dialogContext,
                              rootNavigator: true,
                            );
                            navigator.pop();
                            navigator.pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (_) => LoginController(),
                              ),
                              (route) => false,
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10.r,
                            offset: Offset(0, 5.h),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 20.h,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/ic_logout.svg",
                                width: 20.w,
                                height: 20.h,
                                color: Colors.red,
                              ),
                              SizedBox(width: 10.w),
                              Text(
                                "Logout",
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
