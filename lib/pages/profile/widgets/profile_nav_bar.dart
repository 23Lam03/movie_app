import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/pages/profile/widgets/logout.dart';

class ProfileNavBar extends StatelessWidget {
  const ProfileNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/login/LogoM.png',
          width: 32.w,
          height: 32.h,
        ),
        16.horizontalSpace,
        Text(
          'Profile',
          style: SettingApp.heding1.copyWith(fontSize: 24.sp),
        ),
        const Spacer(), // chiem het == expan
        const Logout()
      ],
    );
  }
}
