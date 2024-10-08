import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  Expanded(
                    child: Text(
                      'Notification',
                      style: SettingApp.heding1.copyWith(fontSize: 24),
                    ),
                  ),
                  12.horizontalSpace,
                  Image.asset(
                    'assets/images/login/MoreCircle.png',
                    width: 22.w,
                    height: 22.h,
                  ),
                ],
              ),
              24.verticalSpace, // Add spacing between header and list
              Expanded(
                child: ListView.builder(
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.notifications, size: 30),
                          ),
                          15.horizontalSpace,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Notification Title',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      ' Title ',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                12.verticalSpace,
                                Text(
                                  'This is the detail of the notification.',
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Colors.grey),
                                ),
                                12.verticalSpace,
                                Text(
                                  'update',
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
