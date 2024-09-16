import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeCustom {
  static ThemeData get darkTheme {
    return ThemeData(
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.urbanist(
          fontWeight: FontWeight.w700,
          fontSize: 48.sp,
          color: const Color(0xffFFFFFF),
        ),
        bodyLarge: GoogleFonts.urbanist(
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
          color: const Color(0xffFFFFFF),
        ),
        bodyMedium: GoogleFonts.urbanist(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: const Color(0xffFFFFFF),
        ),
        bodySmall: GoogleFonts.urbanist(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: const Color(0xfffe21221),
        ),
        
      ),
    );
  }
}
