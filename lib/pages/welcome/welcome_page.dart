import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/pages/lets_you_in/lets_you_in_page.dart';
import 'package:movie_app/widgets/button_main_custom.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/login/BanerWelcom.png',
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 36,
            left: 24,
            right: 24,
            child: Column(
              children: [
                Text(
                  'Welcome to Mova',
                  style: SettingApp.heding1.copyWith(fontSize: 40.sp),
                ),
                24.verticalSpace,
                Text(
                  'The best movie streaming app of the century to make your days great!',
                  style: SettingApp.heding3.copyWith(fontSize: 18.sp),
                  textAlign: TextAlign.center,
                ),
                24.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Container(
                        width: index == 0 ? 32.w : 8.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: index == 0
                              ? const Color(0xffFF4451)
                              : const Color(0xffE0E0E0),
                        ),
                      ),
                    ),
                  ),
                ),
                24.verticalSpace,
                ButtonMainCustom(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LetsYouInPage(),
                      ),
                    );
                  },
                  title: 'Get Started',
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
