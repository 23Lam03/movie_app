import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/my_list/myList.png',
            fit: BoxFit.cover,
          ),
          44.verticalSpace,
          Text(
            'Your List is Empty',
            style: SettingApp.heding1.copyWith(
              fontSize: 24.sp,
              color: SettingApp.colorText,
            ),
          ),
          15.verticalSpace,
          Text(
            'It seems that you haven`t added \n any movies to the list',
            style: SettingApp.heding3.copyWith(fontSize: 18.sp),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
