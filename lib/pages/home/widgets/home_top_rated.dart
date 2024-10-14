import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/routers/router_name.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeTopRated extends StatelessWidget {
  const HomeTopRated({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Consumer<HomeProvider>(
        builder: (_, provider, __) {
          List<MovieModel> listMoviesTopRated = provider.listMovieTopRated;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listMoviesTopRated.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RouterName.movieDetail,
                    arguments: {"id": listMoviesTopRated[index].id},
                  );
                },
                child: AspectRatio(
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
                ),
              );
            },
          );
        },
      ),
    );
  }
}
