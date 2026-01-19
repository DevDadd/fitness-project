import 'package:fitnessai/l10n/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherLoginButton extends StatelessWidget {
  String inputText;
  IconData inputIcon;
  Color iconColor;
  OtherLoginButton({
    super.key,
    required this.inputIcon,
    required this.inputText,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width / 1.1,
      height: 45.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color.fromARGB(255, 224, 65, 81)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 15.r,
            child: ClipOval(
              child: Icon(inputIcon, color: iconColor),
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            inputText,
            style: GoogleFonts.manrope(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
