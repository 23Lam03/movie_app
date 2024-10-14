import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/pages/profile/widgets/profile_download.dart';
import 'package:movie_app/pages/profile/widgets/profile_edit.dart';
import 'package:movie_app/pages/profile/widgets/profile_email.dart';
import 'package:movie_app/pages/profile/widgets/profile_header.dart';
import 'package:movie_app/pages/profile/widgets/profile_help.dart';
import 'package:movie_app/pages/profile/widgets/profile_language.dart';
import 'package:movie_app/pages/profile/widgets/profile_mode.dart';
import 'package:movie_app/pages/profile/widgets/profile_name.dart';
import 'package:movie_app/pages/profile/widgets/profile_nav_bar.dart';
import 'package:movie_app/pages/profile/widgets/profile_notification.dart';
import 'package:movie_app/pages/profile/widgets/profile_premium.dart';
import 'package:movie_app/pages/profile/widgets/profile_privacy.dart';
import 'package:movie_app/pages/profile/widgets/profile_security.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              children: [
                const ProfileNavBar(),
                24.verticalSpace,
                const ProfileHeader(),
                12.verticalSpace,
                const ProfileName(),
                8.verticalSpace,
                const ProfileEmail(),
                24.verticalSpace,
                const ProfilePremium(),
                24.verticalSpace,
                const ProfileEdit(),
                20.verticalSpace,
                const ProfileNotification(),
                20.verticalSpace,
                const ProfileDownload(),
                20.verticalSpace,
                const ProfileSecurity(),
                20.verticalSpace,
                const ProfileLanguage(),
                20.verticalSpace,
                const ProfileMode(),
                20.verticalSpace,
                const ProfileHelp(),
                20.verticalSpace,
                const ProfilePrivacy(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
