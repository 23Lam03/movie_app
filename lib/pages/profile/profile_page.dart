import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/routers/router_name.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/widgets/switch_case.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                  ],
                ),
                24.verticalSpace,
                Stack(
                  children: [
                    Image.asset(
                      'assets/images/profile/AndrewAinsley.png',
                      fit: BoxFit.cover,
                      width: 120.w,
                      height: 120.h,
                    ),
                    Positioned(
                      top: 90,
                      left: 90,
                      child: Image.asset(
                        'assets/images/profile/EditSquare.png',
                        fit: BoxFit.cover,
                        width: 30.w,
                        height: 30.h,
                      ),
                    ),
                  ],
                ),
                12.verticalSpace,
                Text(
                  'Andrew Ainsley',
                  style: SettingApp.heding1.copyWith(fontSize: 20.sp),
                ),
                8.verticalSpace,
                Text(
                  'andrew_ainsley@yourdomain.com',
                  style: SettingApp.heding3.copyWith(fontSize: 14.sp),
                ),
                24.verticalSpace,
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 26.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.r),
                    border: Border.all(
                      width: 2.w,
                      color: const Color(0xffE21221),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/profile/Vector.png',
                        width: 60.w,
                        height: 60.h,
                      ),
                      20.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Join Premium!',
                            style: SettingApp.heding1.copyWith(
                              fontSize: 24.sp,
                              color: SettingApp.colorText,
                            ),
                          ),
                          8.verticalSpace,
                          Text(
                            'Enjoy watching Full-HD movies,\n without restrictions and without ads',
                            style: SettingApp.heding3.copyWith(fontSize: 12.sp),
                          ),
                        ],
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.keyboard_arrow_right,
                            color: SettingApp.colorText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                24.verticalSpace,
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouterName.editProfilePage);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/profile/EditProfile.png',
                        width: 28.w,
                        height: 28.h,
                      ),
                      20.horizontalSpace,
                      Expanded(
                        child: Text(
                          'Edit Profile',
                          style: SettingApp.heding2.copyWith(fontSize: 18),
                        ),
                      ),
                      20.horizontalSpace,
                      const Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ),
                20.verticalSpace,
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouterName.notificationProfilePage);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/profile/Notification.png',
                        width: 28.w,
                        height: 28.h,
                      ),
                      20.horizontalSpace,
                      Expanded(
                        child: Text(
                          'Notification',
                          style: SettingApp.heding2.copyWith(fontSize: 18),
                        ),
                      ),
                      20.horizontalSpace,
                      const Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ),
                20.verticalSpace,
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouterName.downloadProfilePage);
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
                ),
                20.verticalSpace,
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouterName.securityPage);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/profile/Security.png',
                        width: 28.w,
                        height: 28.h,
                      ),
                      20.horizontalSpace,
                      Expanded(
                        child: Text(
                          'Security',
                          style: SettingApp.heding2.copyWith(fontSize: 18),
                        ),
                      ),
                      20.horizontalSpace,
                      const Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ),
                20.verticalSpace,
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouterName.languagePage);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/profile/Language.png',
                        width: 28.w,
                        height: 28.h,
                      ),
                      20.horizontalSpace,
                      Expanded(
                        child: Text(
                          'Language',
                          style: SettingApp.heding2.copyWith(fontSize: 18),
                        ),
                      ),
                      20.horizontalSpace,
                      Expanded(
                        child: Text(
                          'English (US)',
                          style: SettingApp.heding2.copyWith(fontSize: 18),
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ),
                20.verticalSpace,
                Row(
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
                ),
                20.verticalSpace,
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouterName.helpCenterPage);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/profile/HelpCenter.png',
                        width: 28.w,
                        height: 28.h,
                      ),
                      20.horizontalSpace,
                      Expanded(
                        child: Text(
                          'Help Center',
                          style: SettingApp.heding2.copyWith(fontSize: 18),
                        ),
                      ),
                      20.horizontalSpace,
                      const Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ),
                20.verticalSpace,
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouterName.privacyPolicyPage);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/profile/PrivacyPolicy.png',
                        width: 28.w,
                        height: 28.h,
                      ),
                      20.horizontalSpace,
                      Expanded(
                        child: Text(
                          'Privacy Policy',
                          style: SettingApp.heding2.copyWith(fontSize: 18),
                        ),
                      ),
                      20.horizontalSpace,
                      const Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
