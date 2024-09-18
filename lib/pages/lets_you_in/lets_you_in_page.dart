import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:movie_app/app/routers/router_name.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/app/theme_custom.dart';
import 'package:movie_app/pages/lets_you_in/widgets/lets_you_in_or.dart';
import 'package:movie_app/pages/lets_you_in/widgets/lets_you_in_sign_up.dart';
import 'package:movie_app/pages/login/login_page.dart';
import 'package:movie_app/widgets/button_main_custom.dart';

class LetsYouInPage extends StatefulWidget {
  const LetsYouInPage({super.key});

  @override
  State<LetsYouInPage> createState() => _LetsYouInPageState();
}

class _LetsYouInPageState extends State<LetsYouInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void submit() async {
    context.loaderOverlay.show();

    if (_formKey.currentState!.validate()) {
      await Future.delayed(const Duration(seconds: 2));
      context.loaderOverlay.hide();
      Navigator.pushReplacementNamed(context, RouterName.homePage);
    } else {
      context.loaderOverlay.hide();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ThemeCustom.darkTheme;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/login/BannerLogin.png',
                    fit: BoxFit.cover,
                  ),
                  30.verticalSpace,
                  Text('Let’s you in', style: SettingApp.heding1),
                  30.verticalSpace,
                  ButtonMainCustom(
                    onTap: () {},
                    borderColor: const Color(0x0fff222a),
                    borderWidth: 1,
                    borderRadius: 10,
                    backgroundColor: Colors.transparent,
                    isShowIconLeft: true,
                    iconLeft: Image.asset(
                      'assets/images/login/Facebook.png',
                      fit: BoxFit.cover,
                      width: 24.w,
                      height: 24.h,
                    ),
                    title: 'Continue with Facebook',
                  ),
                  16.verticalSpace,
                  ButtonMainCustom(
                    onTap: () {},
                    borderColor: const Color(0x0fff222a),
                    borderWidth: 1,
                    borderRadius: 10,
                    backgroundColor: Colors.transparent,
                    isShowIconLeft: true,
                    iconLeft: Image.asset(
                      'assets/images/login/Google.png',
                      width: 24.w,
                      height: 24.h,
                    ),
                    title: 'Continue with Google',
                  ),
                  16.verticalSpace,
                  ButtonMainCustom(
                    onTap: () {},
                    borderColor: const Color(0x0fff222a),
                    borderWidth: 1,
                    borderRadius: 10,
                    backgroundColor: Colors.transparent,
                    isShowIconLeft: true,
                    iconLeft: Image.asset(
                      'assets/images/login/Apple.png',
                      width: 24.w,
                      height: 24.h,
                    ),
                    title: 'Continue with Apple',
                  ),
                  34.verticalSpace,
                  LetsYouInOr(theme: theme),
                  34.verticalSpace,
                  ButtonMainCustom(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    title: 'Sign in with password',
                  ),
                  30.verticalSpace,
                  LetsYouInSignUp(theme: theme)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
