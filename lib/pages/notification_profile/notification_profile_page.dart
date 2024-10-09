import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/widgets/switch_case.dart';

class NotificationProfilePage extends StatefulWidget {
  const NotificationProfilePage({super.key});

  @override
  State<NotificationProfilePage> createState() =>
      _NotificationProfilePageState();
}

class _NotificationProfilePageState extends State<NotificationProfilePage> {
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
                      'Notification',
                      style: SettingApp.heding1.copyWith(fontSize: 24.sp),
                    ),
                  ],
                ),
                24.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'General Notification',
                        style: SettingApp.heding2.copyWith(fontSize: 18.sp),
                      ),
                    ),
                    const SwitchCase()
                  ],
                ),
                28.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'New Arrival',
                        style: SettingApp.heding2.copyWith(fontSize: 18.sp),
                      ),
                    ),
                    const SwitchCase()
                  ],
                ),
                28.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'New Services Available',
                        style: SettingApp.heding2.copyWith(fontSize: 18.sp),
                      ),
                    ),
                    const SwitchCase()
                  ],
                ),
                28.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'New Releases Movie',
                        style: SettingApp.heding2.copyWith(fontSize: 18.sp),
                      ),
                    ),
                    const SwitchCase()
                  ],
                ),
                28.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'App Updates',
                        style: SettingApp.heding2.copyWith(fontSize: 18.sp),
                      ),
                    ),
                    const SwitchCase()
                  ],
                ),
                28.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Subscription',
                        style: SettingApp.heding2.copyWith(fontSize: 18.sp),
                      ),
                    ),
                    const SwitchCase()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
