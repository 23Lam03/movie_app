import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/const/top_movie.dart';
import 'package:movie_app/pages/home/widgets/home_list.dart';
import 'package:movie_app/pages/home/widgets/home_nav_bar.dart';
import 'package:movie_app/pages/home/widgets/home_new_releases.dart';
import 'package:movie_app/pages/home/widgets/home_top_10_movies.dart';
import 'package:movie_app/pages/home/widgets/home_top_rated.dart';
import 'package:movie_app/pages/home/widgets/home_upcomig.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final homeProvider = context.read<HomeProvider>();
    homeProvider.getListMovieNowPlaying();
    homeProvider.getListMovieReleases();
    homeProvider.getListMovieTopRated();
    homeProvider.getListMovieUpcoming();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HomeNavBar(),
            24.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeList(
                      context: context,
                      name: 'Top 10 Movies This Week',
                      type: TopMovie.PLAYING),
                  16.verticalSpace,
                  const HomeTop10Movies(),
                  16.verticalSpace,
                  HomeList(
                      context: context,
                      name: 'New Releases',
                      type: TopMovie.RELASES),
                  16.verticalSpace,
                  const HomeNewReleases(),
                  16.verticalSpace,
                  HomeList(
                      context: context,
                      name: 'Top Rated',
                      type: TopMovie.RATED),
                  16.verticalSpace,
                  const HomeTopRated(),
                  16.verticalSpace,
                  HomeList(
                      context: context,
                      name: 'Upcoming',
                      type: TopMovie.UPCOMING),
                  16.verticalSpace,
                  const HomeUpcoming(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
