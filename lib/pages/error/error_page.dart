import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/pages/home/home_page.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/error/error.png',
              fit: BoxFit.cover,
            ),
            44.verticalSpace,
            Text(
              'Not Found',
              style: SettingApp.heding1.copyWith(
                fontSize: 24.sp,
                color: SettingApp.colorText,
              ),
            ),
            16.verticalSpace,
            Text(
              'Sorry, the keyword you entered could not be found. Try to check again or search with other keywords.',
              style: SettingApp.heding3.copyWith(fontSize: 18.sp),
            ),
            44.verticalSpace,
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: Text(
                'Back to home',
                style: SettingApp.heding1.copyWith(
                  fontSize: 24.sp,
                  color: SettingApp.colorText,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
