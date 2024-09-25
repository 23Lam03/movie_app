import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
          style: SettingApp.heding1.copyWith(fontSize: 24.sp),
        ),
        actions: [
          Image.asset(
            'assets/images/login/MoreCircle.png',
            fit: BoxFit.cover,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Row(
              children: [
                Container(
                  width: 50.w,
                  height: 50.h,
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
                              'Notification Title ',
                              style: TextStyle(
                                  fontSize: 16.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            ' Title ',
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      12.verticalSpace,
                      Text(
                        'This is the detail of the notification .',
                        style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                      ),
                      12.verticalSpace,
                      Text(
                        'update',
                        style: TextStyle(fontSize: 14.sp, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
