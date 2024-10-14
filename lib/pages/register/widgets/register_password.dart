import 'package:flutter/material.dart';
import 'package:movie_app/widgets/input_custom.dart';

class RegisterPassword extends StatelessWidget {
  const RegisterPassword({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return InputCustom(
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
    );
  }
}
