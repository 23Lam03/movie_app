import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/provider/search_provider.dart';
import 'package:provider/provider.dart';

class SearchPage extends SearchDelegate {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) return Container();

    return FutureBuilder(
      future:
          Provider.of<SearchProvider>(context, listen: false).getSearch(query),
      initialData: const [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        List<MovieModel> search = snapshot.data as List<MovieModel>;

        return ListView.builder(
          itemCount: search.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(search[index].poster_path),
              ),
              title: Text(search[index].title),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future:
          Provider.of<SearchProvider>(context, listen: false).getSearch(query),
      initialData: const [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return const CircularProgressIndicator();
        List<MovieModel> search = snapshot.data as List<MovieModel>;

        return ListView.builder(
          itemCount: search.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(search[index].title),
              onTap: () {},
            );
          },
        );
      },
    );
  }
}
