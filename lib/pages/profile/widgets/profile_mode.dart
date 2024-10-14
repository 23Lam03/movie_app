import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/widgets/switch_case.dart';

class ProfileMode extends StatelessWidget {
  const ProfileMode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/images/profile/DarkMode.png',
          width: 28.w,
          height: 28.h,
        ),
        20.horizontalSpace,
        Expanded(
          child: Text(
            'Dark Mode',
            style: SettingApp.heding2.copyWith(fontSize: 18),
          ),
        ),
        const SwitchCase(),
        20.horizontalSpace,
      ],
    );
  }
}
