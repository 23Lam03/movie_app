import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:movie_app/app/const/accout.dart';
import 'package:movie_app/app/helper/share_pre.dart';
import 'package:movie_app/app/routers/router_name.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/provider/setting_app_provider.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    checkUserLogin();
    super.initState();
  }

  void checkUserLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    String uID = await SharePre.getString(Accout.keyUserId);

    if (uID != '') {
      context.read<SettingAppProvider>().updateUid(uID);
      Navigator.pushReplacementNamed(context, RouterName.bottomNavi);
    } else {
      Navigator.pushReplacementNamed(context, RouterName.loginPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isVisible = context.loaderOverlay.visible;
    context.loaderOverlay.show();
    context.loaderOverlay.hide();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/login/LogoM.png',
              fit: BoxFit.fill,
            ),
            190.verticalSpace,
            SpinKitSpinningLines(
              color: SettingApp.colorText,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
