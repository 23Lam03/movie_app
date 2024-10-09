import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:movie_app/app/routers/router_name.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/provider/auth_provider.dart';
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
        Navigator.pushReplacementNamed(context, RouterName.homePage);
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

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<WidgetState> states) {
      const Set<WidgetState> interactiveStates = <WidgetState>{
        WidgetState.pressed,
        WidgetState.hovered,
        WidgetState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

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
                    // email
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
                    // password
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
                    fillColor: WidgetStateProperty.resolveWith(getColor),
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
                      onTap: () {},
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
                  8.horizontalSpace,
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RouterName.registerPage);
                    },
                    child: Text(
                      'Sign up',
                      style: SettingApp.heding1.copyWith(
                        fontSize: 14,
                        color: SettingApp.colorText,
                      ),
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
