import 'dart:io';

import 'package:fitnessai/feature/authentication/presentation/widgets/custom_text_field.dart';
import 'package:fitnessai/feature/authentication/presentation/widgets/menu_item.dart';
import 'package:fitnessai/feature/authentication/presentation/widgets/other_login_button.dart';
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

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool isSavedPassword = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizeCubit, LocalizeState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              AppLocalizations.of(context)!.signup,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Builder(
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
                CustomTextField(
                  hintText: AppLocalizations.of(context)!.password,
                  leadingIcon: "assets/icons/ic_password.svg",
                  width: MediaQuery.sizeOf(context).width / 1.1,
                  obscureText: true,
                ),
                SizedBox(height: 30),
                CustomTextField(
                  hintText: AppLocalizations.of(context)!.password2,
                  leadingIcon: "assets/icons/ic_password.svg",
                  width: MediaQuery.sizeOf(context).width / 1.1,
                  obscureText: true,
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppLocalizations.of(context)!.alreadyhaveaccount,
                    style: GoogleFonts.manrope(
                      color: const Color.fromARGB(255, 214, 60, 76),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Row(
                  children: const [
                    Expanded(child: Divider(thickness: 1)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Đăng nhập khác',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(child: Divider(thickness: 1)),
                  ],
                ),
                SizedBox(height: 20.h),
                OtherLoginButton(
                  inputIcon: FontAwesomeIcons.google,
                  inputText: AppLocalizations.of(context)!.loginwithgoogle,
                  iconColor: const Color.fromARGB(255, 224, 65, 81),
                ),
                SizedBox(height: 15),
                OtherLoginButton(
                  inputIcon: FontAwesomeIcons.facebook,
                  inputText: AppLocalizations.of(context)!.loginwithfb,
                  iconColor: Color(0xFF1877F2),
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
                              AppLocalizations.of(context)!.signup,
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
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                AppLocalizations.of(context)!.login,
                                style: GoogleFonts.manrope(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                ),
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
