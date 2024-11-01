import 'package:flutter/material.dart';
import 'package:movie_app/app/routers/router_name.dart';
import 'package:movie_app/models/movie_search_model.dart';
import 'package:movie_app/provider/search_provider.dart';
import 'package:movie_app/widgets/empty_data.dart';
import 'package:movie_app/widgets/loading/search_loading.dart';
import 'package:provider/provider.dart';

class SearchPage extends SearchDelegate {
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
    // Provider.of<SearchProvider>(context, listen: false).getSearch(query);
    return ChangeNotifierProvider(
      create: (context) => SearchProvider(),
      builder: (context, child) {
        Provider.of<SearchProvider>(context, listen: false).getSearch(query);

        return StreamBuilder(
          stream: context.read<SearchProvider>().streamController.stream,
          initialData: const [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SearchLoading();
            }
            if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
              return const EmptyData();
            }
            List<MovieSearchModel> search =
                snapshot.data as List<MovieSearchModel>;
            return ListView.builder(
              itemCount: search.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouterName.movieDetail,
                      arguments: {"id": search[index].id},
                    );
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      foregroundImage: NetworkImage(
                        'https://image.tmdb.org/t/p/w500${search[index].backdrop_path}',
                      ),
                    ),
                    title: Text(search[index].name),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
    // Provider.of<SearchProvider>(context, listen: false).getSearch(query);

    // return Consumer<SearchProvider>(
    //   builder: (context, provider, _) {
    //     List<MovieDetailModel> search = provider.searchResults;

    //     return ListView.builder(
    //       itemCount: search.length,
    //       itemBuilder: (context, index) {
    //         return ListTile(
    //           title: Text(search[index].title),
    //           onTap: () {},
    //         );
    //       },
    //     );
    //   },
    // );
  }
}
