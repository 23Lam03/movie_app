import 'package:flutter/material.dart';
import 'package:movie_app/app/const/top_movie.dart';
import 'package:movie_app/app/routers/router_name.dart';
import 'package:movie_app/models/video_model.dart';
import 'package:movie_app/pages/bottom_navi/bottom_navi.dart';
import 'package:movie_app/pages/detail/detail_page.dart';
import 'package:movie_app/pages/download/download_page.dart';
import 'package:movie_app/pages/download_profile/download_profile_page.dart';
import 'package:movie_app/pages/edit_profile/edit_profile_page.dart';
import 'package:movie_app/pages/explore/explore_page.dart';
import 'package:movie_app/pages/help_center/help_center_page.dart';
import 'package:movie_app/pages/home/home_page.dart';
import 'package:movie_app/pages/language/language_page.dart';
import 'package:movie_app/pages/login/login_page.dart';
import 'package:movie_app/pages/notification/notification_page.dart';
import 'package:movie_app/pages/notification_profile/notification_profile_page.dart';
import 'package:movie_app/pages/privacy_policy/privacy_policy_page.dart';
import 'package:movie_app/pages/profile/profile_page.dart';
import 'package:movie_app/pages/register/register_page.dart';
import 'package:movie_app/pages/security/security_page.dart';
import 'package:movie_app/pages/see_all/see_all_page.dart';
import 'package:movie_app/pages/video/video_page.dart';
import 'package:movie_app/pages/welcome/welcome_page.dart';
import 'package:page_transition/page_transition.dart';

class RouterCustom {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterName.homePage:
        return PageTransition(
          child: const HomePage(),
          type: PageTransitionType.rightToLeft,
        );
      case RouterName.welcomePage:
        return PageTransition(
          child: const WelcomePage(),
          type: PageTransitionType.rightToLeft,
        );

      case RouterName.seeAllPage:
        Map arg = settings.arguments as Map;
        String name = arg["name"];
        TopMovie type = arg["type"];
        return PageTransition(
          child: SeeAllPage(
            type: type,
            name: name,
          ),
          type: PageTransitionType.rightToLeft,
        );
      case RouterName.loginPage:
        return PageTransition(
          child: const LoginPage(),
          type: PageTransitionType.rightToLeft,
        );
      case RouterName.notificationPage:
        return PageTransition(
          child: const NotificationPage(),
          type: PageTransitionType.rightToLeft,
        );
      case RouterName.movieDetail:
        Map arg = settings.arguments as Map;
        return PageTransition(
          child: DetailPage(
            id: arg['id'],
          ),
          type: PageTransitionType.rightToLeft,
        );
      case RouterName.videoPage:
        VideoModel arg = settings.arguments as VideoModel;
        return PageTransition(
          child: VideoPage(
            video: arg,
          ),
          type: PageTransitionType.fade,
        );
      case RouterName.explorePage:
        return PageTransition(
          child: const ExplorePage(),
          type: PageTransitionType.fade,
        );
      case RouterName.profilePage:
        return PageTransition(
          child: const ProfilePage(),
          type: PageTransitionType.fade,
        );
      case RouterName.editProfilePage:
        return PageTransition(
          child: const EditProfilePage(uId: 'user'),
          type: PageTransitionType.fade,
        );
      case RouterName.downloadPage:
        return PageTransition(
          child: const DownloadPage(),
          type: PageTransitionType.fade,
        );
      case RouterName.notificationProfilePage:
        return PageTransition(
          child: const NotificationProfilePage(),
          type: PageTransitionType.fade,
        );
      case RouterName.downloadProfilePage:
        return PageTransition(
          child: const DownloadProfilePage(),
          type: PageTransitionType.fade,
        );
      case RouterName.securityPage:
        return PageTransition(
          child: const SecurityPage(),
          type: PageTransitionType.fade,
        );
      case RouterName.languagePage:
        return PageTransition(
          child: const LanguagePage(),
          type: PageTransitionType.fade,
        );
      case RouterName.privacyPolicyPage:
        return PageTransition(
          child: const PrivacyPolicyPage(),
          type: PageTransitionType.fade,
        );
      case RouterName.helpCenterPage:
        return PageTransition(
          child: const HelpCenterPage(),
          type: PageTransitionType.fade,
        );
      case RouterName.registerPage:
        return PageTransition(
          child: const RegisterPage(),
          type: PageTransitionType.fade,
        );
      case RouterName.bottomNavi:
        return PageTransition(
          child: const BottomNavi(),
          type: PageTransitionType.fade,
        );
      default:
        return null;
    }
  }
}
