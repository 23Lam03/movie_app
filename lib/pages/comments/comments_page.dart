import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/widgets/input_name_custom.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Text(
                    '24.6K Comments',
                    style: SettingApp.heding1.copyWith(fontSize: 24.sp),
                  ),
                  const Spacer(),
                  Image.asset(
                    'assets/images/detail/MoreCircle.png',
                    color: const Color(0xffFFFFFF),
                  ),
                ],
              ),
            ),
            24.verticalSpace,
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/detail/avatadetail.png',
                              width: 48.w,
                              height: 48.h,
                            ),
                            16.horizontalSpace,
                            Expanded(
                              child: Text(
                                'Kristin Watson',
                                style: SettingApp.heding1
                                    .copyWith(fontSize: 16.sp),
                              ),
                            ),
                            Image.asset(
                              'assets/images/detail/MoreCircle.png',
                              color: const Color(0xffFFFFFF),
                              width: 24.w,
                              height: 24.h,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        12.verticalSpace,
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.',
                          style: SettingApp.heding4,
                        ),
                        12.verticalSpace,
                        Row(
                          children: [
                            const Icon(Icons.favorite),
                            8.horizontalSpace,
                            const Text('938'),
                            24.horizontalSpace,
                            const Text('3 days ago'),
                          ],
                        ),
                        29.verticalSpace,
                      ],
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24.r),
                    topRight: Radius.circular(24.r)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xff1F222A),
                    blurRadius: 24,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InputNameCustom(
                      hintText: 'Add comment...',
                      prefixIcon: const Icon(Icons.tag_faces),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Container(
                    padding: EdgeInsets.all(18.w),
                    decoration: const BoxDecoration(
                      color: Color(0xffE21221),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.send,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
