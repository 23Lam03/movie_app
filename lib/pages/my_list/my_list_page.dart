import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/widgets/empty_data.dart';

class MyListPage extends StatefulWidget {
  const MyListPage({super.key});

  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              children: [
                Row(
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
                        'My List',
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
                164.verticalSpace,
                const EmptyData(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
