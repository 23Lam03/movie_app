import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/pages/register/widgets/register_comfirm_password.dart';
import 'package:movie_app/pages/register/widgets/register_email.dart';
import 'package:movie_app/pages/register/widgets/register_name_and_usename.dart';
import 'package:movie_app/pages/register/widgets/register_password.dart';
import 'package:movie_app/pages/register/widgets/register_phone.dart';
import 'package:movie_app/provider/auth_registet_provider.dart';
import 'package:movie_app/utils/get_size.dart';
import 'package:movie_app/widgets/button_main_custom.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  List<String> typeSex = ['Male', 'Female'];

  TextEditingController emailController =
      TextEditingController(text: 'demo@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: '123456');
  TextEditingController confirmPasswordController =
      TextEditingController(text: '123456');
  TextEditingController nameController = TextEditingController(text: 'Lam');
  TextEditingController userNameController = TextEditingController(text: 'Duc');
  TextEditingController phoneNumberController =
      TextEditingController(text: '2341241');
  String gender = '';
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
        Navigator.pop(context, {
          "email": emailController.text,
          "password": passwordController.text
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Center(
              child: Text('Registered successfully!'),
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Center(
              child: Text('Registration failed!'),
            ),
          ),
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
                      RegisterEmail(emailController: emailController),
                      20.verticalSpace,
                      RegisterPassword(passwordController: passwordController),
                      20.verticalSpace,
                      RegisterComfirmPassword(
                          confirmPasswordController: confirmPasswordController,
                          passwordController: passwordController),
                      20.verticalSpace,
                      RegisterNameAndUseName(
                          nameController: nameController,
                          userNameController: userNameController),
                      20.verticalSpace,
                      RegisterPhone(
                          phoneNumberController: phoneNumberController),
                      20.verticalSpace,
                      Container(
                        width: getWidth(context),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 9.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: const Color(0xff1F222A),
                        ),
                        child: DropdownButton<String>(
                          value: typeSex[0],
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 24.sp,
                          underline: const SizedBox(),
                          isExpanded: true,
                          style: SettingApp.heding2.copyWith(
                            fontSize: 14.sp,
                            color: Colors.white,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              gender = newValue!;
                            });
                          },
                          items: typeSex
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      20.verticalSpace,
                      ButtonMainCustom(
                        onTap: register,
                        title: 'Register',
                      ),
                      20.verticalSpace,
                      InkWell(
                        onTap: () {
                          Navigator.pop(context, {'email': '', 'password': ''});
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
