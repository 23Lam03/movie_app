import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/models/model_user.dart';
import 'package:movie_app/provider/setting_app_provider.dart';
import 'package:movie_app/utils/get_size.dart';
import 'package:movie_app/widgets/button_main_custom.dart';
import 'package:movie_app/widgets/input_custom.dart';
import 'package:movie_app/widgets/input_name_custom.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key, required this.uId});

  final String uId;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController sexController = TextEditingController();

  bool isLoadingImage = false;
  bool isSubmitting = false;

  @override
  void initState() {
    super.initState();
    final userInfo = context.read<SettingAppProvider>().userInfo!;
    fullNameController.text = userInfo.fullName;
    nameController.text = userInfo.name;
    emailController.text = userInfo.email;
    phoneController.text = userInfo.phone;
    sexController.text = userInfo.sex;
  }

  Future<void> submitImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      return;
    }

    final file = File(image.path);
    final metadata = SettableMetadata(contentType: "image/jpeg");
    final storageRef = FirebaseStorage.instance.ref();

    setState(() {
      isLoadingImage = true;
    });

    try {
      final uploadTask = storageRef
          .child("avatar/${context.read<SettingAppProvider>().uId}")
          .putFile(file, metadata);

      uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
        switch (taskSnapshot.state) {
          case TaskState.running:
            final progress = 100.0 *
                (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
            break;
          case TaskState.success:
            String link = await taskSnapshot.ref.getDownloadURL();
            context.read<SettingAppProvider>().updateAvata(link);
            setState(() {
              isLoadingImage = false;
            });
            break;
          default:
            break;
        }
      });
    } catch (e) {
      setState(() {
        isLoadingImage = false;
      });
    }
  }

  Future<void> onSubmit() async {
    if (emailController.text.isEmpty ||
        !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter a valid email.")));
      return;
    }

    if (phoneController.text.isEmpty ||
        !RegExp(r'^[0-9]+$').hasMatch(phoneController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter a valid phone number.")));
      return;
    }

    setState(() {
      isSubmitting = true;
    });

    try {
      context.read<SettingAppProvider>().updateInfo(
            ModelUser(
              image: context.read<SettingAppProvider>().userInfo!.image,
              name: nameController.text,
              fullName: fullNameController.text,
              phone: phoneController.text,
              sex: sexController.text,
              email: emailController.text,
            ),
          );
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Profile updated successfully!")));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error updating profile.")));
    }

    setState(() {
      isSubmitting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingAppProvider>(builder: (_, provider, __) {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Column(
                children: [
                  // App bar
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      16.horizontalSpace,
                      Text(
                        'Edit Profile',
                        style: SettingApp.heding1.copyWith(fontSize: 24.sp),
                      ),
                    ],
                  ),
                  24.verticalSpace,

                  // Profile Image and Edit Button
                  Stack(
                    children: [
                      provider.userInfo!.image.isNotEmpty
                          ? Image.network(
                              provider.userInfo!.image,
                              fit: BoxFit.cover,
                              width: 120.w,
                              height: 120.h,
                            )
                          : Image.asset(
                              'assets/images/profile/placeholder.png',
                              fit: BoxFit.cover,
                              width: 120.w,
                              height: 120.h,
                            ),
                      Positioned(
                        top: 90,
                        left: 90,
                        child: InkWell(
                          onTap: submitImage,
                          child: isLoadingImage
                              ? Center(
                                  child: SpinKitSpinningLines(
                                    color: SettingApp.colorText,
                                    size: 50.0,
                                  ),
                                )
                              : Image.asset(
                                  'assets/images/profile/EditSquare.png',
                                  fit: BoxFit.cover,
                                  width: 30.w,
                                  height: 30.h,
                                ),
                        ),
                      ),
                    ],
                  ),
                  24.verticalSpace,

                  // Full Name Input
                  InputNameCustom(
                    controller: fullNameController,
                    hintText: 'Full Name',
                  ),
                  24.verticalSpace,

                  // Name Input
                  InputNameCustom(
                    controller: nameController,
                    hintText: 'Name',
                  ),
                  24.verticalSpace,

                  // Email Input
                  InputCustom(
                    controller: emailController,
                    hintText: 'Email Address',
                    prefixIcon: Image.asset(
                      'assets/images/profile/Email.png',
                      width: 20.w,
                      height: 20.h,
                    ),
                    filled: false,
                    fillColor: const Color(0xff1F222A),
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
                  24.verticalSpace,

                  // Phone Input
                  Container(
                    width: getWidth(context),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: const Color(0xff1F222A),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/profile/Usa.png',
                          width: 24.w,
                          height: 18.h,
                        ),
                        8.horizontalSpace,
                        const Icon(Icons.expand_more),
                        12.horizontalSpace,
                        Expanded(
                          child: InputNameCustom(
                            controller: phoneController,
                            hintText: 'Phone',
                          ),
                        ),
                      ],
                    ),
                  ),
                  24.verticalSpace,

                  InputNameCustom(
                    controller: sexController,
                    hintText: 'Gender',
                  ),
                  24.verticalSpace,

                  Container(
                    width: getWidth(context),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: const Color(0xff1F222A),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'United States',
                            style: SettingApp.heding2.copyWith(
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/images/profile/icon.png',
                          width: 20.w,
                          height: 20.h,
                        )
                      ],
                    ),
                  ),
                  60.verticalSpace,

                  // Submit Button
                  ButtonMainCustom(
                    onTap: onSubmit,
                    title: isSubmitting ? 'Updating...' : 'Update',
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
