import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputCustom extends StatefulWidget {
  InputCustom({
    super.key,
    this.prefixIcon,
    this.hintText,
    this.obscureText = false,
    this.controller,
    required String? Function(dynamic value) validator,
  });

  Widget? prefixIcon;
  String? hintText;
  bool obscureText;
  TextEditingController? controller;
  @override
  State<InputCustom> createState() => _InputCustomState();
}

class _InputCustomState extends State<InputCustom> {
  late bool isOpenEye;

  @override
  void initState() {
    isOpenEye = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      controller: widget.controller,
      obscureText: isOpenEye,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.obscureText
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isOpenEye = !isOpenEye;
                  });
                },
                child: Icon(
                  isOpenEye ? Icons.visibility_off : Icons.remove_red_eye,
                ),
              )
            : null,
        border: OutlineInputBorder(
          gapPadding: 16.sp,
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        hintText: widget.hintText,
        filled: true,
        fillColor: const Color(0xff9F9F9F),
      ),
    );
  }
}
