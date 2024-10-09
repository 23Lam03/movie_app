import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/const/top_movie.dart';
import 'package:movie_app/app/routers/router_name.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/pages/home/widgets/home_nav_bar.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:movie_app/widgets/loading/home_loading.dart';
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
                  homeTitle(
                      context, 'Top 10 Movies This Week', TopMovie.PLAYING),
                  16.verticalSpace,
                  SizedBox(
                    height: 200.h,
                    child: Consumer<HomeProvider>(
                      builder: (_, provider, __) {
                        List<MovieModel> listMovies =
                            provider.listMovieNowPlaying;
                        if (listMovies.isEmpty) {
                          return const HomeLoading();
                        }
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listMovies.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RouterName.movieDetail,
                                  arguments: {"id": listMovies[index].id},
                                );
                              },
                              child: AspectRatio(
                                aspectRatio: .8 / 1,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 12),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500${listMovies[index].poster_path}',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 8,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  16.verticalSpace,
                  homeTitle(context, 'New Releases', TopMovie.RELASES),
                  16.verticalSpace,
                  SizedBox(
                    height: 200.h,
                    child: Consumer<HomeProvider>(
                      builder: (_, provider, __) {
                        List<MovieModel> listMoviesReleases =
                            provider.listMovieReleases;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listMoviesReleases.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AspectRatio(
                              aspectRatio: .8 / 1,
                              child: Container(
                                margin: const EdgeInsets.only(right: 12),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500${listMoviesReleases[index].poster_path}',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  16.verticalSpace,
                  homeTitle(context, 'Top Rated', TopMovie.RATED),
                  16.verticalSpace,
                  SizedBox(
                    height: 200.h,
                    child: Consumer<HomeProvider>(
                      builder: (_, provider, __) {
                        List<MovieModel> listMoviesTopRated =
                            provider.listMovieTopRated;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listMoviesTopRated.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AspectRatio(
                              aspectRatio: .8 / 1,
                              child: Container(
                                margin: const EdgeInsets.only(right: 12),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500${listMoviesTopRated[index].poster_path}',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  16.verticalSpace,
                  homeTitle(context, 'Upcoming', TopMovie.UPCOMING),
                  16.verticalSpace,
                  SizedBox(
                    height: 200.h,
                    child: Consumer<HomeProvider>(
                      builder: (_, provider, __) {
                        List<MovieModel> listMovieUpcoming =
                            provider.listMovieUpcoming;
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listMovieUpcoming.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AspectRatio(
                              aspectRatio: .8 / 1,
                              child: Container(
                                margin: const EdgeInsets.only(right: 12),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500${listMovieUpcoming[index].poster_path}',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row homeTitle(
    BuildContext context,
    String name,
    TopMovie type,
  ) {
    return Row(
      children: [
        Expanded(
          child: Text(
            name,
            style: SettingApp.heding1.copyWith(fontSize: 20.sp),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              RouterName.seeAllPage,
              arguments: {"name": name, "type": type},
            );
          },
          child: Text(
            'See all',
            style: SettingApp.heding2.copyWith(
              fontSize: 14.sp,
              color: SettingApp.colorText,
            ),
          ),
        ),
      ],
    );
  }
}
