import 'dart:io';

import 'package:fitnessai/feature/authentication/controller/signup_controller.dart';
import 'package:fitnessai/feature/authentication/cubit/authentication_cubit.dart';
import 'package:fitnessai/feature/authentication/cubit/authentication_state.dart';
import 'package:fitnessai/feature/authentication/presentation/widgets/custom_text_field.dart';
import 'package:fitnessai/feature/authentication/presentation/widgets/menu_item.dart';
import 'package:fitnessai/feature/authentication/presentation/widgets/other_login_button.dart';
import 'package:fitnessai/feature/core/localization/cubit/localize_cubit.dart';
import 'package:fitnessai/feature/core/localization/cubit/localize_state.dart';
import 'package:fitnessai/home_page_core_provider.dart';
import 'package:fitnessai/l10n/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popover/popover.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSavedPassword = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                    controller: emailController,
                    obscureText: false,
                    hintText: "Gmail",
                    leadingIcon: "assets/icons/ic_profile.svg",
                    width: MediaQuery.sizeOf(context).width / 1.1,
                  ),
                ),

                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: passwordController,
                        hintText: AppLocalizations.of(context)!.password,
                        leadingIcon: "assets/icons/ic_password.svg",
                        width: double.infinity,
                        obscureText: true,
                      ),
                    ),
                    SizedBox(width: 12.w),
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
                SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                      value: isSavedPassword,
                      onChanged: (value) {
                        setState(() => isSavedPassword = value!);
                      },
                      fillColor: MaterialStateProperty.resolveWith(
                        (_) => Colors.transparent,
                      ),
                      checkColor: Colors.green,
                      side: MaterialStateBorderSide.resolveWith(
                        (_) => const BorderSide(color: Colors.black, width: 2),
                      ),
                      overlayColor: MaterialStateProperty.all(
                        Colors.transparent,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.savepassword,
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      AppLocalizations.of(context)!.forgotpassword,
                      style: GoogleFonts.manrope(
                        fontWeight: FontWeight.w900,
                        fontSize: 14.sp,
                        color: const Color.fromARGB(255, 224, 65, 81),
                      ),
                    ),
                  ],
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
                BlocListener<AuthenticationCubit, AuthenticationState>(
                  listenWhen: (previous, current) =>
                      previous.status != current.status,
                  listener: (context, state) {
                    if (!(ModalRoute.of(context)?.isCurrent ?? false)) {
                      return;
                    }

                    if (state.status == AuthenticationStatus.success) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePageCoreProvider(),
                        ),
                      ).then((_) {
                        if (context.mounted) {
                          context.read<AuthenticationCubit>().reset();
                        }
                      });
                    }

                    if (state.status == AuthenticationStatus.error) {
                      showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (sheetContext) {
                          return DraggableScrollableSheet(
                            expand: false,
                            initialChildSize: 0.34,
                            minChildSize: 0.24,
                            maxChildSize: 0.55,
                            builder: (context, scrollController) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 8.h),
                                    child: Center(
                                      child: Container(
                                        width: 40.w,
                                        height: 4.h,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade400,
                                          borderRadius: BorderRadius.circular(
                                            2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Material(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20.r),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      color: Colors.white,
                                      child: SingleChildScrollView(
                                        controller: scrollController,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 20.w,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 30.h,
                                                ),
                                                child: SvgPicture.asset(
                                                  'assets/icons/ic_login_failed.svg',
                                                  colorFilter:
                                                      const ColorFilter.mode(
                                                        Color.fromARGB(
                                                          255,
                                                          233,
                                                          93,
                                                          51,
                                                        ),
                                                        BlendMode.srcIn,
                                                      ),
                                                  width: 45.w,
                                                  height: 45.h,
                                                ),
                                              ),
                                              Text(
                                                'Login failed',
                                                style: GoogleFonts.manrope(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20.sp,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(height: 3.h),
                                              Text(
                                                state.errorMessage,
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.manrope(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14.sp,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(height: 10.h),
                                              Text(
                                                'Please try again',
                                                style: GoogleFonts.manrope(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(height: 20.h),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "Understand",
                                                  style: GoogleFonts.manrope(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 14.sp,
                                                    color: Colors.redAccent,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      );
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: SafeArea(
                      child: Center(
                        child: Column(
                          children: [
                            BlocBuilder<
                              AuthenticationCubit,
                              AuthenticationState
                            >(
                              buildWhen: (previous, current) =>
                                  previous.status != current.status,
                              builder: (context, state) {
                                final loading =
                                    state.status ==
                                    AuthenticationStatus.loading;
                                return GestureDetector(
                                  onTap: loading
                                      ? null
                                      : () {
                                          context
                                              .read<AuthenticationCubit>()
                                              .login(
                                                emailController.text,
                                                passwordController.text,
                                              );
                                        },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width / 1.1,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                        255,
                                        214,
                                        60,
                                        76,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: loading
                                          ? SizedBox(
                                              width: 22,
                                              height: 22,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                                color: Colors.white,
                                              ),
                                            )
                                          : Text(
                                              AppLocalizations.of(
                                                context,
                                              )!.login,
                                              style: GoogleFonts.manrope(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.sp,
                                              ),
                                            ),
                                    ),
                                  ),
                                );
                              },
                            ),

                            const SizedBox(height: 10),

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupController(),
                                  ),
                                );
                              },
                              child: Container(
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
                            ),
                          ],
                        ),
                      ),
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
