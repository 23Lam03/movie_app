import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/routers/router_name.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/pages/home/widgets/home_nav_bar.dart';
import 'package:movie_app/pages/my_list/my_list_page.dart';
import 'package:movie_app/pages/see_all/see_all_page.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyListPage(),
          ),
        );
      }
    });
  }

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
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Top 10 Movies This Week',
                          style: SettingApp.heding1.copyWith(fontSize: 20.sp),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SeeAllPage(),
                            ),
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
                  ),
                  16.verticalSpace,
                  SizedBox(
                    height: 200.h,
                    child: Consumer<HomeProvider>(
                      builder: (_, provider, __) {
                        List<MovieModel> listMovies =
                            provider.listMovieNowPlaying;
                        if (listMovies.isEmpty) {
                          return const Center(
                              child: CircularProgressIndicator());
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
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'New Releases',
                          style: SettingApp.heding1.copyWith(fontSize: 20.sp),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SeeAllPage(),
                            ),
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
                  ),
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
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Top Rated',
                          style: SettingApp.heding1.copyWith(fontSize: 20.sp),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SeeAllPage(),
                            ),
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
                  ),
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
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Upcoming',
                          style: SettingApp.heding1.copyWith(fontSize: 20.sp),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SeeAllPage(),
                            ),
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
                  ),
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'My List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_download),
            label: 'Download',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
