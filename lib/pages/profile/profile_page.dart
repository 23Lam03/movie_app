import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';
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
import 'package:movie_app/provider/setting_app_provider.dart';
import 'package:provider/provider.dart';

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
                20.verticalSpace,
                InkWell(
                  onTap: () async {
                    final shouldDelete = await showDialog<bool>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Delete Account'),
                          content: const Text(
                              'Are you sure you want to delete your account? This action cannot be undone.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text('Delete'),
                            ),
                          ],
                        );
                      },
                    );

                    if (shouldDelete == true) {
                      // Access the SettingAppProvider
                      final settingProvider = Provider.of<SettingAppProvider>(
                          context,
                          listen: false);

                      // Call the deleteUser method
                      settingProvider.deleteUser();

                      // Show feedback or navigate away if needed
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Account deleted successfully.'),
                      ));
                    }
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/profile/Delete.png',
                        width: 28.w,
                        height: 28.h,
                      ),
                      20.horizontalSpace,
                      Expanded(
                        child: Text(
                          'Delete User', // Corrected text
                          style: SettingApp.heding2.copyWith(fontSize: 18),
                        ),
                      ),
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
