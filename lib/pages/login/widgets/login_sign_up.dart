import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginSignUp extends StatelessWidget {
  const LoginSignUp({
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
          style: theme.textTheme.bodyMedium,
        ),
        8.horizontalSpace,
        Text(
          'Sign up',
          style: theme.textTheme.bodySmall,
        )
      ],
    );
  }
}
