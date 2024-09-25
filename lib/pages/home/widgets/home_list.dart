import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeList extends StatefulWidget {
  HomeList({
    super.key,
    this.title = 'Top 10 Movies This Week',
  });
  String title;

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                widget.title,
                style: SettingApp.heding1.copyWith(fontSize: 20.sp),
              ),
            ),
            GestureDetector(
              onTap: () {},
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
              List<MovieModel> listMovies = provider.listMovieNowPlaying;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listMovies.length,
                itemBuilder: (BuildContext context, int index) {
                  return AspectRatio(
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
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
