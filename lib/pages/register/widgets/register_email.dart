import 'package:flutter/material.dart';
import 'package:movie_app/widgets/input_custom.dart';

class RegisterEmail extends StatelessWidget {
  const RegisterEmail({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return InputCustom(
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
    );
  }
}
