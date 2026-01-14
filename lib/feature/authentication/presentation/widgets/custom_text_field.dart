import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  String hintText;
  String leadingIcon;
  IconData? exitIcon;
  double width;

  CustomTextField({
    super.key,
    required this.hintText,
    required this.leadingIcon,
    required this.width,
    this.exitIcon,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController inputController = TextEditingController();
    return Container(
      width: width,
      height: 50.h,
      decoration: BoxDecoration(
        color: Color(0xFFE7EAF3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 20),
        child: Row(
          children: [
            SvgPicture.asset(leadingIcon, color: Colors.black),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: inputController,
                decoration: InputDecoration(
                  labelText: hintText,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
