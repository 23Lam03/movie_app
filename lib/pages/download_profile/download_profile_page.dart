import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/widgets/switch_case.dart';

class DownloadProfilePage extends StatelessWidget {
  const DownloadProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    16.horizontalSpace,
                    Text(
                      'Download',
                      style: SettingApp.heding1.copyWith(fontSize: 24.sp),
                    ),
                  ],
                ),
                24.verticalSpace,
                Row(
                  children: [
                    Image.asset(
                      'assets/images/profile/wifi.png',
                      width: 28.w,
                      height: 28.h,
                    ),
                    20.horizontalSpace,
                    Expanded(
                      child: Text(
                        'Wi-Fi Only',
                        style: SettingApp.heding2.copyWith(fontSize: 18.sp),
                      ),
                    ),
                    const SwitchCase(),
                    20.horizontalSpace,
                  ],
                ),
                28.verticalSpace,
                Row(
                  children: [
                    Image.asset(
                      'assets/images/profile/Download.png',
                      width: 28.w,
                      height: 28.h,
                    ),
                    20.horizontalSpace,
                    Expanded(
                      child: Text(
                        'Smart Downloads',
                        style: SettingApp.heding2.copyWith(fontSize: 18.sp),
                      ),
                    ),
                    20.horizontalSpace,
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.keyboard_arrow_right),
                    ),
                  ],
                ),
                28.verticalSpace,
                Row(
                  children: [
                    Image.asset(
                      'assets/images/profile/Video.png',
                      width: 28.w,
                      height: 28.h,
                    ),
                    20.horizontalSpace,
                    Expanded(
                      child: Text(
                        'Video Quality',
                        style: SettingApp.heding2.copyWith(fontSize: 18.sp),
                      ),
                    ),
                    20.horizontalSpace,
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.keyboard_arrow_right),
                    ),
                  ],
                ),
                28.verticalSpace,
                Row(
                  children: [
                    Image.asset(
                      'assets/images/profile/Voice.png',
                      width: 28.w,
                      height: 28.h,
                    ),
                    20.horizontalSpace,
                    Expanded(
                      child: Text(
                        'Audio Quality',
                        style: SettingApp.heding2.copyWith(fontSize: 18.sp),
                      ),
                    ),
                    20.horizontalSpace,
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.keyboard_arrow_right),
                    ),
                  ],
                ),
                28.verticalSpace,
                Row(
                  children: [
                    Image.asset(
                      'assets/images/profile/Delete.png',
                      width: 28.w,
                      height: 28.h,
                    ),
                    20.horizontalSpace,
                    Expanded(
                      child: Text(
                        'Delete All Downloads',
                        style: SettingApp.heding2.copyWith(fontSize: 18.sp),
                      ),
                    ),
                  ],
                ),
                28.verticalSpace,
                Row(
                  children: [
                    Image.asset(
                      'assets/images/profile/Delete.png',
                      width: 28.w,
                      height: 28.h,
                    ),
                    20.horizontalSpace,
                    Expanded(
                      child: Text(
                        'Delete Cache',
                        style: SettingApp.heding2.copyWith(fontSize: 18.sp),
                      ),
                    ),
                  ],
                ),
                28.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
