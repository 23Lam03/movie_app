import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';

class ButtonMainCustom extends StatelessWidget {
  ButtonMainCustom({
    super.key,
    this.title = '',
    this.colorTitle = Colors.white,
    this.backgroundColor = const Color(0xffE21221),
    this.splashColor = Colors.white24,
    required this.onTap,
    this.iconLeft,
    this.isShowIconLeft = false,
    this.isShowThemeText = false,
    this.borderRadius = 100.0,
    this.borderColor = const Color(0xffE21221),
    this.borderWidth = 1,
    this.themeText = const TextStyle(),
    this.paddingVertical = 18,
    this.paddingHorizontal = 16,
  });

  String title;
  Color colorTitle, backgroundColor, splashColor, borderColor;
  Widget? iconLeft;
  bool isShowIconLeft, isShowThemeText;
  double borderRadius, borderWidth, paddingVertical, paddingHorizontal;
  VoidCallback onTap;
  TextStyle? themeText;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(borderRadius),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: splashColor,
        onTap: onTap,
        child: Ink(
          padding: (EdgeInsets.symmetric(
              vertical: paddingVertical, horizontal: paddingHorizontal)),
          // width: getWidth(context),
          decoration: BoxDecoration(
            border: Border.all(
              width: borderWidth,
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
            color: backgroundColor,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isShowIconLeft
                  ? Row(
                      children: [
                        iconLeft ?? const SizedBox(),
                        8.horizontalSpace,
                      ],
                    )
                  : const SizedBox.shrink(),
              Text(
                title,
                style: isShowThemeText
                    ? themeText
                    : SettingApp.heding1.copyWith(
                        fontSize: 16.sp,
                        color: colorTitle,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
