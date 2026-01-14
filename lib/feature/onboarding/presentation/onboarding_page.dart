import 'package:fitnessai/feature/authentication/presentation/pages/login_page.dart';
import 'package:fitnessai/l10n/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            width: 1.sw,
            child: SvgPicture.asset(
              "assets/images/onboarding_bg.svg",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 49.74.h),
          Text(
            AppLocalizations.of(context)!.onboardingtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.merriweather(
              color: Color(0xFF2B2B2B),
              fontSize: 36.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 35.h),
          Text(
            AppLocalizations.of(context)!.onboardingdes,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Color(0xFFC4C4C4),
              fontWeight: FontWeight.normal,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 62.h),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 254, 99, 72), Color.fromARGB(255, 241, 50, 16)],
              ),
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(161.w, 46.h),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
              ),
              child: Text(
                AppLocalizations.of(context)!.getstarted,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
