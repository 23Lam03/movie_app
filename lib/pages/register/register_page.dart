import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/provider/auth_registet_provider.dart';
import 'package:movie_app/widgets/button_main_custom.dart';
import 'package:movie_app/widgets/input_custom.dart';
import 'package:movie_app/widgets/input_name_custom.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    userNameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  void register() async {
    if (_formKey.currentState!.validate()) {
      final authRegisterProvider =
          Provider.of<AuthRegistetProvider>(context, listen: false);
      bool isRegistered = await authRegisterProvider.register(
        emailController.text,
        passwordController.text,
        nameController.text,
        userNameController.text,
        phoneNumberController.text,
      );
      if (isRegistered) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registered successfully!')),
        );

        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Registration failed!')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/login/LogoM.png',
                    fit: BoxFit.cover,
                  ),
                ),
                39.verticalSpace,
                Text(
                  'Sign Up',
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
                      20.verticalSpace,
                      InputCustom(
                        controller: confirmPasswordController,
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'Confirm password',
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value != passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                      ),
                      20.verticalSpace,
                      Row(
                        children: [
                          Expanded(
                            child: InputNameCustom(
                              controller: nameController,
                              hintText: 'Name',
                            ),
                          ),
                          10.horizontalSpace,
                          Expanded(
                            child: InputNameCustom(
                              controller: userNameController,
                              hintText: 'UserName',
                            ),
                          ),
                        ],
                      ),
                      20.verticalSpace,
                      InputNameCustom(
                        controller: phoneNumberController,
                        hintText: 'Phone Number',
                      ),
                      20.verticalSpace,
                      ButtonMainCustom(
                        onTap: register,
                        title: 'Register',
                      ),
                      20.verticalSpace,
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Back to Login',
                          style: SettingApp.heding4.copyWith(
                              fontSize: 15.sp, color: SettingApp.colorText),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
