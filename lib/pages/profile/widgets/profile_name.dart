import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/provider/setting_app_provider.dart';
import 'package:provider/provider.dart';

class ProfileName extends StatelessWidget {
  const ProfileName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingAppProvider>(builder: (_, provider, __) {
      return Text(
        provider.userInfo!.fullName,
        style: SettingApp.heding1.copyWith(fontSize: 20.sp),
      );
    });
  }
}
