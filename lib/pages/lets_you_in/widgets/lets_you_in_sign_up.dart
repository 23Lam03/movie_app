import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';

class LetsYouInSignUp extends StatelessWidget {
  const LetsYouInSignUp({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don’t have an account?',
          style: SettingApp.heding4,
        ),
        8.horizontalSpace,
        Text(
          'Sign up',
          style: SettingApp.heding1.copyWith(
            fontSize: 14,
            color: const Color(0xffE21221),
          ),
        ),
      ],
    );
  }
}
