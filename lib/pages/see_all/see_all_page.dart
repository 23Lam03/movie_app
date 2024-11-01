import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/const/top_movie.dart';
import 'package:movie_app/app/routers/router_name.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/pages/search/search_page.dart';
import 'package:movie_app/provider/see_all_provider.dart';
import 'package:movie_app/widgets/loading/see_all_loading.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SeeAllPage extends StatelessWidget {
  SeeAllPage({super.key, required this.name, required this.type});
  String name;
  TopMovie type;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SeeAllProvider()..getListTop(type),
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      Expanded(
                        child: Text(
                          name,
                          style: SettingApp.heding1.copyWith(fontSize: 24.sp),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await showSearch(
                            context: context,
                            delegate: SearchPage(),
                          );
                        },
                        child: Image.asset(
                          'assets/images/login/Search.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  24.verticalSpace,
                  Expanded(
                    child: Consumer<SeeAllProvider>(
                      builder: (__, provider, _) {
                        List<MovieModel> data = provider.listData;
                        if (data.isEmpty) {
                          return const SeeAllLoading();
                        }
                        return SmartRefresher(
                          controller: provider.refreshController,
                          onLoading: provider.onLoading,
                          onRefresh: provider.onRefresh,
                          enablePullDown: true,
                          enablePullUp: true,
                          child: GridView.builder(
                            physics: const AlwaysScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 168 / 248,
                            ),
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    RouterName.movieDetail,
                                    arguments: {"id": data[index].id},
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white10,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500${data[index].poster_path}',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 8,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
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
