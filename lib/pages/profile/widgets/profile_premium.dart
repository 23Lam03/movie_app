import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';

class ProfilePremium extends StatelessWidget {
  const ProfilePremium({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 26.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.r),
        border: Border.all(
          width: 2.w,
          color: const Color(0xffE21221),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            'assets/images/profile/Vector.png',
            width: 60.w,
            height: 60.h,
          ),
          20.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Join Premium!',
                style: SettingApp.heding1.copyWith(
                  fontSize: 24.sp,
                  color: SettingApp.colorText,
                ),
              ),
              8.verticalSpace,
              Text(
                'Enjoy watching Full-HD movies,\n without restrictions and without ads',
                style: SettingApp.heding3.copyWith(fontSize: 12.sp),
              ),
            ],
          ),
          Expanded(
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.keyboard_arrow_right,
                color: SettingApp.colorText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
