import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/utils/get_size.dart';
import 'package:movie_app/widgets/button_main_custom.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});
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
                      'Edit Profile',
                      style: SettingApp.heding1.copyWith(fontSize: 24.sp),
                    ),
                  ],
                ),
                24.verticalSpace,
                Image.asset(
                  'assets/images/profile/AndrewAinsley.png',
                  fit: BoxFit.cover,
                  width: 120.w,
                  height: 120.h,
                ),
                24.verticalSpace,
                Container(
                  width: getWidth(context),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: const Color(0xff1F222A),
                  ),
                  child: Text(
                    'Andrew Ainsley',
                    style: SettingApp.heding2.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                24.verticalSpace,
                Container(
                  width: getWidth(context),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: const Color(0xff1F222A),
                  ),
                  child: Text(
                    'Andrew',
                    style: SettingApp.heding2.copyWith(
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                24.verticalSpace,
                Container(
                  width: getWidth(context),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: const Color(0xff1F222A),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'andrew_ainsley@yourdomain.com',
                          style: SettingApp.heding2.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/profile/Email.png',
                        width: 20.w,
                        height: 20.h,
                      )
                    ],
                  ),
                ),
                24.verticalSpace,
                Container(
                  width: getWidth(context),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: const Color(0xff1F222A),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/profile/Usa.png',
                        width: 24.w,
                        height: 18.h,
                      ),
                      8.horizontalSpace,
                      const Icon(Icons.expand_more),
                      12.horizontalSpace,
                      Expanded(
                        child: Text(
                          '+1 111 467 378 399',
                          style: SettingApp.heding2.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                24.verticalSpace,
                Container(
                  width: getWidth(context),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: const Color(0xff1F222A),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Male',
                          style: SettingApp.heding2.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/profile/icon.png',
                        width: 20.w,
                        height: 20.h,
                      )
                    ],
                  ),
                ),
                24.verticalSpace,
                Container(
                  width: getWidth(context),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: const Color(0xff1F222A),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'United States',
                          style: SettingApp.heding2.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      Image.asset(
                        'assets/images/profile/icon.png',
                        width: 20.w,
                        height: 20.h,
                      )
                    ],
                  ),
                ),
                60.verticalSpace,
                ButtonMainCustom(
                  onTap: () {},
                  title: 'Update',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
