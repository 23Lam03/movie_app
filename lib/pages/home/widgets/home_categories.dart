import 'package:flutter/material.dart';
import 'package:movie_app/app/routers/router_name.dart';
import 'package:movie_app/models/movie_model.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({
    super.key,
    required this.listMovies,
  });

  final List<MovieModel> listMovies;

  @override
  Widget build(BuildContext context) {
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
  }
}
