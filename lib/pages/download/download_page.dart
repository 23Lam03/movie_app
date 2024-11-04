import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/pages/search/search_page.dart';

class DownloadPage extends StatefulWidget {
  const DownloadPage({super.key});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/login/LogoM.png',
                    width: 32.w,
                    height: 32.h,
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: Text(
                      'Download',
                      style: SettingApp.heding1.copyWith(fontSize: 24.sp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: InkWell(
                      onTap: () async {
                        await showSearch(
                          context: context,
                          delegate: SearchPage(),
                        );
                      },
                      child: Image.asset(
                        'assets/images/login/Search.png',
                        width: 28.w,
                        height: 28.h,
                      ),
                    ),
                  ),
                ],
              ),
              200.verticalSpace,
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/my_list/myList.png'),
                    20.verticalSpace,
                    Text(
                      'Under development....',
                      style: SettingApp.heding1.copyWith(fontSize: 20.sp),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
