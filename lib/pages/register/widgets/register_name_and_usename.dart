import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/widgets/input_name_custom.dart';

class RegisterNameAndUseName extends StatelessWidget {
  const RegisterNameAndUseName({
    super.key,
    required this.nameController,
    required this.userNameController,
  });

  final TextEditingController nameController;
  final TextEditingController userNameController;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
