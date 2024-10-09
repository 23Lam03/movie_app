import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/login/LogoM.png',
                width: 32.w,
                height: 32.h,
              ),
              16.horizontalSpace,
              Expanded(
                child: Text(
                  'Download',
                  style: SettingApp.heding1.copyWith(fontSize: 24.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Image.asset(
                  'assets/images/login/Search.png',
                  width: 28.w,
                  height: 28.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
