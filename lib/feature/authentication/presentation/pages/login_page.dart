import 'dart:io';

import 'package:fitnessai/feature/authentication/presentation/widgets/custom_text_field.dart';
import 'package:fitnessai/feature/authentication/presentation/widgets/menu_item.dart';
import 'package:fitnessai/feature/core/localization/cubit/localize_cubit.dart';
import 'package:fitnessai/feature/core/localization/cubit/localize_state.dart';
import 'package:fitnessai/l10n/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popover/popover.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizeCubit, LocalizeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              AppLocalizations.of(context)!.login,
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w700,
                fontSize: 25.sp,
                color: Colors.black,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset("assets/icons/ic_back.svg"),
            ),
            actions: [
              Container(
                height: 35.h,
                width: 100.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFF34859).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 5.w),
                    Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: FaIcon(
                          FontAwesomeIcons.google,
                          size: 20,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      "Google",
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w900,
                        color: const Color.fromARGB(255, 214, 81, 81),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 15.w),
              Builder(
                builder: (ctx) {
                  return GestureDetector(
                    onTap: () {
                      showPopover(
                        context: ctx,
                        bodyBuilder: (_) => const MenuItem(),
                        direction: PopoverDirection.bottom,
                        width: 250,
                        height: 90,
                        arrowHeight: 10,
                        arrowWidth: 20,
                      );
                    },
                    // child: CircleAvatar(
                    //   radius: 15.r,
                    //   backgroundColor: Colors.transparent,
                    //   child: ClipOval(
                    //     child: SvgPicture.asset(
                    //       'assets/images/flag_uk.svg',
                    //       width: 40,
                    //       height: 40,
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                    child: state.currentLanguage == "vi"
                        ? CircleAvatar(
                            radius: 15.r,
                            backgroundColor: Colors.transparent,
                            child: ClipOval(
                              child: SvgPicture.asset(
                                'assets/images/flag_vn.svg',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : CircleAvatar(
                            radius: 15.r,
                            backgroundColor: Colors.transparent,
                            child: ClipOval(
                              child: SvgPicture.asset(
                                'assets/images/flag_uk.svg',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                  );
                },
              ),

              SizedBox(width: 10.w),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CustomTextField(
                    obscureText: false,
                    hintText: AppLocalizations.of(context)!.account,
                    leadingIcon: "assets/icons/ic_profile.svg",
                    width: MediaQuery.sizeOf(context).width / 1.1,
                  ),
                ),

                const SizedBox(height: 30),
                Row(
                  children: [
                    CustomTextField(
                      hintText: AppLocalizations.of(context)!.password,
                      leadingIcon: "assets/icons/ic_password.svg",
                      width: MediaQuery.sizeOf(context).width / 1.35,
                      obscureText: true,
                    ),
                    SizedBox(width: 15.w),
                    Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE7EAF3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Platform.isAndroid
                          ? SvgPicture.asset(
                              "assets/icons/ic_fingerid.svg",
                              color: const Color.fromARGB(255, 224, 65, 81),
                            )
                          : SvgPicture.asset(
                              "assets/icons/ic_faceid.svg",
                              color: const Color.fromARGB(255, 224, 65, 81),
                            ),
                    ),
                  ],
                ),

                const Spacer(),
                SafeArea(
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width / 1.1,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 214, 60, 76),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.login,
                              style: GoogleFonts.manrope(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),
                        Container(
                          width: MediaQuery.sizeOf(context).width / 1.1,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              AppLocalizations.of(context)!.createaccount,
                              style: GoogleFonts.manrope(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
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
          ),
        );
      },
    );
  }
}
