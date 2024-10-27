import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/routers/router_name.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/provider/setting_app_provider.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('notification')
              .doc(context.read<SettingAppProvider>().uId)
              .collection('notificationData')
              .orderBy('time', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }
            List data = snapshot.data!.docs;
            return SafeArea(
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
                    24.verticalSpace,
                    Expanded(
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              String notificationId = data[index].id;

                              Navigator.pushNamed(
                                context,
                                RouterName.notificationDetails,
                                arguments: notificationId,
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(Icons.notifications,
                                        size: 30),
                                  ),
                                  15.horizontalSpace,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data[index]['title'],
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold),
                                          maxLines: 1,
                                        ),
                                        12.verticalSpace,
                                        Text(
                                          data[index]['body'],
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.grey),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        12.verticalSpace,
                                        Text(
                                          timeago.format(
                                              (data[index]['time'] as Timestamp)
                                                  .toDate()),
                                          style: TextStyle(fontSize: 12.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
