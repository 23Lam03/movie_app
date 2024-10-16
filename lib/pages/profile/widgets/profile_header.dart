import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/provider/setting_app_provider.dart';
import 'package:provider/provider.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingAppProvider>(builder: (_, provider, __) {
      return Stack(
        children: [
          provider.userInfo!.image.isNotEmpty
              ? Image.network(
                  provider.userInfo!.image,
                  fit: BoxFit.cover,
                  width: 120.w,
                  height: 120.h,
                )
              : const SizedBox.shrink(),
          Positioned(
            top: 90,
            left: 90,
            child: Image.asset(
              'assets/images/profile/EditSquare.png',
              fit: BoxFit.cover,
              width: 30.w,
              height: 30.h,
            ),
          ),
        ],
      );
    });
  }
}
