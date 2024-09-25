import 'package:flutter/material.dart';
import 'package:movie_app/app/routers/router_name.dart';
import 'package:movie_app/pages/detail/detail_page.dart';
import 'package:movie_app/pages/home/home_page.dart';
import 'package:movie_app/pages/login/login_page.dart';
import 'package:movie_app/pages/notification/notification_page.dart';
import 'package:movie_app/pages/see_all/see_all_page.dart';
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
        return PageTransition(
          child: const SeeAllPage(),
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

      default:
        return null;
    }
  }
}
