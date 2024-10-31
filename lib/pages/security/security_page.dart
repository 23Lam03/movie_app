import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/widgets/button_main_custom.dart';
import 'package:movie_app/widgets/switch_case.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Security',
                      style: SettingApp.heding1.copyWith(fontSize: 24.sp),
                    ),
                  ],
                ),
                24.verticalSpace,
                Text(
                  'Control',
                  style: SettingApp.heding1.copyWith(fontSize: 20.sp),
                ),
                24.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Security Alerts',
                        style: SettingApp.heding1.copyWith(fontSize: 20.sp),
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_right),
                  ],
                ),
                24.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Manage Devices',
                        style: SettingApp.heding1.copyWith(fontSize: 20.sp),
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_right),
                  ],
                ),
                24.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Manage Permission',
                        style: SettingApp.heding1.copyWith(fontSize: 20.sp),
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_right),
                  ],
                ),
                24.verticalSpace,
                Text(
                  'Security',
                  style: SettingApp.heding1.copyWith(fontSize: 20.sp),
                ),
                24.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Remember me',
                        style: SettingApp.heding1.copyWith(fontSize: 20.sp),
                      ),
                    ),
                    const SwitchCase(),
                  ],
                ),
                24.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Face ID',
                        style: SettingApp.heding1.copyWith(fontSize: 20.sp),
                      ),
                    ),
                    const SwitchCase(),
                  ],
                ),
                24.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Biometric ID',
                        style: SettingApp.heding1.copyWith(fontSize: 20.sp),
                      ),
                    ),
                    const SwitchCase(),
                  ],
                ),
                24.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Google Authenticator',
                        style: SettingApp.heding1.copyWith(fontSize: 20.sp),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.keyboard_arrow_right,
                        color: SettingApp.colorText,
                      ),
                    ),
                  ],
                ),
                24.verticalSpace,
                ButtonMainCustom(
                  onTap: () {},
                  backgroundColor: const Color(0xff35383F),
                  borderColor: const Color(0xff35383F),
                  title: 'Change PIN',
                ),
                24.verticalSpace,
                ButtonMainCustom(
                  onTap: () {},
                  backgroundColor: const Color(0xff35383F),
                  borderColor: const Color(0xff35383F),
                  title: 'Change Password',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
