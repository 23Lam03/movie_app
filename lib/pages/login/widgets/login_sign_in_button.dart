import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/utils/get_size.dart';

class LoginSignInButton extends StatelessWidget {
  const LoginSignInButton({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: (const EdgeInsets.symmetric(vertical: 18)),
      width: getWidth(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color(0xffE21221),
      ),
      child: Text(
        'Sign in with password',
        style: theme.textTheme.headlineLarge?.copyWith(fontSize: 16.sp),
      ),
    );
  }
}
