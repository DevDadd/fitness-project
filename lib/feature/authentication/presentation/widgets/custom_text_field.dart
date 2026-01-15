import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String leadingIcon;
  final IconData? exitIcon;
  final double width;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.leadingIcon,
    required this.width,
    this.exitIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = TextEditingController();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isFocused = _focusNode.hasFocus;
    
    return Container(
      width: widget.width,
      height: 60.h,
      decoration: BoxDecoration(
        color: Color(0xFFE7EAF3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isFocused ? Colors.green : Colors.transparent,
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 10, left: 20),
        child: Row(
          children: [
            SvgPicture.asset(widget.leadingIcon, color: Colors.black),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                cursorColor: Color.fromARGB(255, 214, 60, 76),
                controller: _controller,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: widget.hintText,
                  labelStyle: GoogleFonts.manrope(),
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
