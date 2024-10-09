import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputNameCustom extends StatefulWidget {
  InputNameCustom({
    super.key,
    this.prefixIcon,
    this.hintText,
    this.obscureText = false,
    this.controller,
    this.fillColor = const Color(0xff9F9F9F),
    this.filled = true,
  });

  Widget? prefixIcon;
  String? hintText;
  bool obscureText;
  bool filled;
  TextEditingController? controller;
  Color fillColor;
  @override
  State<InputNameCustom> createState() => _InputCustomState();
}

class _InputCustomState extends State<InputNameCustom> {
  late bool isOpenEye;

  @override
  void initState() {
    isOpenEye = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          gapPadding: 16.sp,
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        hintText: widget.hintText,
        filled: true,
        fillColor: const Color(0xff1F222A),
      ),
    );
  }
}
