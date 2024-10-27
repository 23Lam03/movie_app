import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/routers/router_name.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/pages/search/search_page.dart';
import 'package:movie_app/provider/setting_app_provider.dart';
import 'package:movie_app/widgets/button_main_custom.dart';
import 'package:provider/provider.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/login/DrStrange2.png',
          fit: BoxFit.cover,
        ),
        SafeArea(
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
                Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        await showSearch(
                          context: context,
                          delegate: SearchPage(),
                        );
                      },
                      child: Image.asset(
                        'assets/images/login/Search.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    20.horizontalSpace,
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouterName.notificationPage,
                        );
                      },
                      child: StreamBuilder(
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

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Text("Loading");
                            }
                            List data = snapshot.data!.docs;

                            return Badge.count(
                              count: data.length,
                              child: Image.asset(
                                'assets/images/login/Notification.png',
                                fit: BoxFit.cover,
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 24,
          left: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. Strange 2',
                style: SettingApp.heding1.copyWith(fontSize: 24.sp),
              ),
              8.verticalSpace,
              Text(
                'Action, Superhero, Science Fiction, ...',
                style: SettingApp.heding3.copyWith(fontSize: 12.sp),
              ),
              8.verticalSpace,
              Row(
                children: [
                  ButtonMainCustom(
                    onTap: () {},
                    paddingHorizontal: 16,
                    paddingVertical: 6,
                    isShowIconLeft: true,
                    iconLeft: const Icon(Icons.play_circle),
                    title: 'Play',
                  ),
                  12.horizontalSpace,
                  ButtonMainCustom(
                    onTap: () {},
                    paddingHorizontal: 16,
                    paddingVertical: 6,
                    isShowIconLeft: true,
                    backgroundColor: Colors.transparent,
                    borderWidth: 2,
                    borderColor: const Color(0xffFFFFFF),
                    iconLeft: const Icon(Icons.add),
                    title: 'My List',
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
