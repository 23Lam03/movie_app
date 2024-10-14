import 'package:flutter/material.dart';
import 'package:movie_app/widgets/input_custom.dart';

class RegisterComfirmPassword extends StatelessWidget {
  const RegisterComfirmPassword({
    super.key,
    required this.confirmPasswordController,
    required this.passwordController,
  });

  final TextEditingController confirmPasswordController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return InputCustom(
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
    );
  }
}
