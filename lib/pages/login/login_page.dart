import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:movie_app/app/routers/router_name.dart';
import 'package:movie_app/pages/login/widgets/login_apple.dart';
import 'package:movie_app/pages/login/widgets/login_facebook.dart';
import 'package:movie_app/pages/login/widgets/login_google.dart';
import 'package:movie_app/pages/login/widgets/login_or.dart';
import 'package:movie_app/pages/login/widgets/login_sign_in_button.dart';
import 'package:movie_app/pages/login/widgets/login_sign_up.dart';
import 'package:movie_app/widgets/theme_custom.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                    Text('Let’s you in', style: theme.textTheme.headlineLarge),
                    30.verticalSpace,
                    LoginFacebook(theme: theme),
                    16.verticalSpace,
                    LoginGoogle(theme: theme),
                    16.verticalSpace,
                    LoginApple(theme: theme),
                    34.verticalSpace,
                    LoginOr(theme: theme),
                    34.verticalSpace,
                    LoginSignInButton(theme: theme),
                    30.verticalSpace,
                    LoginSignUp(theme: theme)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
