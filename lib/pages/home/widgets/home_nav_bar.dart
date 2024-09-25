import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/routers/router_name.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/widgets/button_main_custom.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 24),
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
                    Image.asset(
                      'assets/images/login/Search.png',
                      fit: BoxFit.cover,
                    ),
                    20.horizontalSpace,
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouterName.notificationPage,
                        );
                      },
                      child: Image.asset(
                        'assets/images/login/Notification.png',
                        fit: BoxFit.cover,
                      ),
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
