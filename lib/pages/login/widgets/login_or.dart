import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/utils/get_size.dart';

class LoginOr extends StatelessWidget {
  const LoginOr({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            width: getWidth(context) / 2,
            color: const Color(0xff35383F),
          ),
        ),
        16.horizontalSpace,
        Text(
          'or',
          style: theme.textTheme.bodyLarge?.copyWith(fontSize: 18.sp),
        ),
        16.horizontalSpace,
        Expanded(
          child: Container(
            width: getWidth(context) / 2,
            color: const Color(0xff35383F),
          ),
        ),
      ],
    );
  }
}
