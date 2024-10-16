import 'package:cached_network_image/cached_network_image.dart';
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
              ? Container(
                  width: 120.w,
                  height: 120.h,
                  decoration: const BoxDecoration(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000.r),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: provider.userInfo!.image,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      );
    });
  }
}
