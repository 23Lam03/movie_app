import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:movie_app/app/routers/router_custom.dart';
import 'package:movie_app/pages/splash/splash_page.dart';
import 'package:movie_app/provider/auth_provider.dart';
import 'package:movie_app/provider/auth_registet_provider.dart';
import 'package:movie_app/provider/detail_provider.dart';
import 'package:movie_app/provider/genre_provider.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:movie_app/provider/setting_app_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => HomeProvider()..initHome(),
            ),
            ChangeNotifierProvider(
              create: (context) => DetailProvider(),
            ),
            // ChangeNotifierProvider(
            //   create: (context) => SearchProvider(),
            // )
            ChangeNotifierProvider(
              create: (context) => AuthProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => AuthRegistetProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => GenreProvider(),
            ),
            ChangeNotifierProvider(
              create: (context) => SettingAppProvider(),
            ),
          ],
          child: GlobalLoaderOverlay(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RouterCustom.onGenerateRoute,
              home: const SplashPage(),
              theme: ThemeData.dark(),
            ),
          ),
        );
      },
    );
  }
}
