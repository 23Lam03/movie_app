import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/routers/router_name.dart';
import 'package:movie_app/app/setting_app.dart';

class ProfileDownload extends StatelessWidget {
  const ProfileDownload({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouterName.downloadProfilePage);
      },
      child: Row(
        children: [
          Image.asset(
            'assets/images/profile/Download.png',
            width: 28.w,
            height: 28.h,
          ),
          20.horizontalSpace,
          Expanded(
            child: Text(
              'Download',
              style: SettingApp.heding2.copyWith(fontSize: 18),
            ),
          ),
          20.horizontalSpace,
          const Icon(Icons.keyboard_arrow_right),
        ],
      ),
    );
  }
}
