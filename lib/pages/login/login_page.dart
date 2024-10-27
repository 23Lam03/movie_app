import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:movie_app/app/const/accout.dart';
import 'package:movie_app/app/helper/share_pre.dart';
import 'package:movie_app/app/routers/router_name.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/provider/auth_provider.dart';
import 'package:movie_app/provider/setting_app_provider.dart';
import 'package:movie_app/utils/get_size.dart';
import 'package:movie_app/widgets/button_main_custom.dart';
import 'package:movie_app/widgets/input_custom.dart';
import 'package:provider/provider.dart';

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
      bool isLogin = await context.read<AuthProvider>().login(
            emailController.text,
            passwordController.text,
          );
      context.loaderOverlay.hide();
      if (isLogin) {
        String uID = await SharePre.getString(Accout.keyUserId);
        context.read<SettingAppProvider>().updateUid(uID);
        Navigator.pushReplacementNamed(context, RouterName.bottomNavi);
      } else {
        // Show a SnackBar if login fails
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Center(
              child: Text('Login failed. Please try again.'),
            ),
          ),
        );
      }
    } else {
      context.loaderOverlay.hide();
    }
  }

  Future<void> _loginWithGoogle() async {
    context.loaderOverlay.show();
    bool isLogin = await context.read<AuthProvider>().signInWithGoogle();
    context.loaderOverlay.hide();
    if (isLogin) {
      Navigator.pushReplacementNamed(context, RouterName.bottomNavi);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Google Sign-In failed. Please try again.')),
      );
    }
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/login/LogoM.png',
                  fit: BoxFit.cover,
                ),
              ),
              39.verticalSpace,
              Text(
                'Create Your Account',
                style: SettingApp.heding1.copyWith(fontSize: 32),
              ),
              39.verticalSpace,
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputCustom(
                      controller: emailController,
                      prefixIcon: const Icon(Icons.email),
                      hintText: 'Email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    20.verticalSpace,
                    InputCustom(
                      controller: passwordController,
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Password',
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.blue,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  12.horizontalSpace,
                  Text(
                    'Remember me',
                    style: SettingApp.heding2.copyWith(fontSize: 14),
                  ),
                ],
              ),
              20.verticalSpace,
              ButtonMainCustom(onTap: submit, title: 'Login'),
              39.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: getWidth(context) / 2,
                      color: const Color(0xff35383F),
                    ),
                  ),
                  16.horizontalSpace,
                  Text(
                    'or continue with',
                    style: SettingApp.heding2.copyWith(fontSize: 18.sp),
                  ),
                  16.horizontalSpace,
                  Expanded(
                    child: Container(
                      width: getWidth(context) / 2,
                      color: const Color(0xff35383F),
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ButtonMainCustom(
                      onTap: () {},
                      backgroundColor: const Color(0xff1F222A),
                      borderColor: Colors.transparent,
                      borderRadius: 16,
                      isShowIconLeft: true,
                      iconLeft: Image.asset('assets/images/login/Facebook.png'),
                    ),
                  ),
                  20.horizontalSpace,
                  Expanded(
                    child: ButtonMainCustom(
                      onTap: _loginWithGoogle,
                      backgroundColor: const Color(0xff1F222A),
                      borderColor: Colors.transparent,
                      borderRadius: 16,
                      isShowIconLeft: true,
                      iconLeft: Image.asset('assets/images/login/Google.png'),
                    ),
                  ),
                  20.horizontalSpace,
                  Expanded(
                    child: ButtonMainCustom(
                      onTap: () {},
                      backgroundColor: const Color(0xff1F222A),
                      borderColor: Colors.transparent,
                      borderRadius: 16,
                      isShowIconLeft: true,
                      iconLeft: Image.asset('assets/images/login/Apple.png'),
                    ),
                  ),
                ],
              ),
              39.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: SettingApp.heding4,
                  ),
                  4.horizontalSpace,
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, RouterName.registerPage)
                          .then((value) {
                        if (value != null && value is Map) {
                          emailController.text = value['email'] ?? '';
                          passwordController.text = value['password'] ?? '';
                        }
                      });
                    },
                    child: Text(
                      'Register',
                      style:
                          SettingApp.heding4.copyWith(color: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
