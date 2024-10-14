import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:movie_app/app/routers/router_name.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/models/movie_genre.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/provider/genre_provider.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:movie_app/widgets/button_main_custom.dart';
import 'package:movie_app/widgets/loading/explore_loading.dart';
import 'package:provider/provider.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({
    super.key,
  });

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 18.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: const Color(0xff1F222A),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/login/Search.png',
                                fit: BoxFit.cover,
                                width: 15.w,
                                height: 15.h,
                              ),
                              12.horizontalSpace,
                              Text(
                                'Search',
                                style: SettingApp.heding4.copyWith(
                                  fontSize: 14.sp,
                                  color: const Color(0xff757575),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      12.horizontalSpace,
                      InkWell(
                        onTap: () {
                          showMaterialModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) => Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 35.h, horizontal: 24.w),
                                decoration: BoxDecoration(
                                  color: const Color(0xff35383F),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40.r),
                                    topRight: Radius.circular(40.r),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text(
                                        'Sort & Filter',
                                        style: SettingApp.heding1.copyWith(
                                          fontSize: 24.sp,
                                          color: SettingApp.colorText,
                                        ),
                                      ),
                                    ),
                                    16.verticalSpace,
                                    _category('Categories'),
                                    _category('Regions'),
                                    _category('Genre'),
                                    _category('Time/Periods'),
                                    _category('Sort'),
                                    48.verticalSpace,
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ButtonMainCustom(
                                            onTap: () {},
                                            title: 'Reset',
                                            backgroundColor:
                                                const Color(0xff35383F),
                                            borderColor:
                                                const Color(0xff35383F),
                                          ),
                                        ),
                                        12.horizontalSpace,
                                        Expanded(
                                          child: ButtonMainCustom(
                                            onTap: () {},
                                            title: 'Apply',
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Image.asset(
                            'assets/images/my_list/Explore.png',
                            fit: BoxFit.cover,
                            width: 20.w,
                            height: 20.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                  24.verticalSpace,
                  Expanded(
                    child: Consumer<HomeProvider>(
                      builder: (context, provider, _) {
                        List<MovieModel> data = provider.listMovieNowPlaying;
                        if (data.isEmpty) {
                          return const ExploreLoading();
                        }
                        return GridView.builder(
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
}

Widget _category(String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: SettingApp.heding1.copyWith(
          fontSize: 20.sp,
        ),
      ),
      16.verticalSpace,
      SizedBox(
        height: 60.h,
        child: Consumer<GenreProvider>(builder: (_, provider, __) {
          List<MovieGenre> genre = provider.listGenre;
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 20.h),
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: SettingApp.colorText),
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Text(
                    'dssdfsd',
                    style: SettingApp.heding2
                        .copyWith(fontSize: 16.sp, color: SettingApp.colorText),
                  ),
                ),
              );
            },
          );
        }),
      ),
    ],
  );
}
