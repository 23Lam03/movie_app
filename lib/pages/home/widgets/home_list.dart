import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/const/top_movie.dart';
import 'package:movie_app/app/routers/router_name.dart';
import 'package:movie_app/app/setting_app.dart';

class HomeList extends StatelessWidget {
  const HomeList({
    super.key,
    required this.context,
    required this.name,
    required this.type,
  });

  final BuildContext context;
  final String name;
  final TopMovie type;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            name,
            style: SettingApp.heding1.copyWith(fontSize: 20.sp),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              RouterName.seeAllPage,
              arguments: {"name": name, "type": type},
            );
          },
          child: Text(
            'See all',
            style: SettingApp.heding2.copyWith(
              fontSize: 14.sp,
              color: SettingApp.colorText,
            ),
          ),
        ),
      ],
    );
  }
}
