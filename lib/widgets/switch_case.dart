import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';

class SwitchCase extends StatefulWidget {
  const SwitchCase({super.key});

  @override
  State<SwitchCase> createState() => _SwitchCaseState();
}

class _SwitchCaseState extends State<SwitchCase> {
  final _controller = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return AdvancedSwitch(
      controller: _controller,
      activeColor: SettingApp.colorText,
      inactiveColor: Colors.grey,
      borderRadius: BorderRadius.all(Radius.circular(1000.r)),
      width: 44.w,
      height: 24.h,
      enabled: true,
      disabledOpacity: 0.5,
    );
  }
}
