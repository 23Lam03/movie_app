import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:movie_app/pages/login/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GlobalLoaderOverlay(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const LoginPage(),
            theme: ThemeData.dark(),
          ),
        );
      },
    );
  }
}
