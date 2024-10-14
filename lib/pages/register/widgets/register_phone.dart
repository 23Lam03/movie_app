import 'package:flutter/material.dart';
import 'package:movie_app/widgets/input_name_custom.dart';

class RegisterPhone extends StatelessWidget {
  const RegisterPhone({
    super.key,
    required this.phoneNumberController,
  });

  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return InputNameCustom(
      controller: phoneNumberController,
      hintText: 'Phone Number',
    );
  }
}
