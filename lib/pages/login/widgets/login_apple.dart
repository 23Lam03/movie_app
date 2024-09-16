import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginApple extends StatelessWidget {
  const LoginApple({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 84, vertical: 18),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), border: Border.all()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/login/Apple.png',
              width: 24.w,
              height: 24.h,
            ),
          ),
          12.horizontalSpace,
          Text(
            'Continue with Apple',
            style: theme.textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
