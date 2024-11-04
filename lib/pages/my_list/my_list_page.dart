import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/pages/search/search_page.dart';
import 'package:movie_app/provider/my_list_provider.dart';
import 'package:movie_app/provider/setting_app_provider.dart';
import 'package:movie_app/widgets/empty_data.dart';
import 'package:provider/provider.dart';

class MyListPage extends StatefulWidget {
  const MyListPage({super.key});

  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchFavorites();
  }

  void fetchFavorites() async {
    setState(() => _isLoading = true);
    await Provider.of<MyListProvider>(context, listen: false)
        .fetchFavoriteMovies(context.read<SettingAppProvider>().uId);
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/login/LogoM.png',
                      width: 32.w,
                      height: 32.h,
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Text(
                        'My List',
                        style: SettingApp.heding1.copyWith(fontSize: 24.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: GestureDetector(
                        onTap: fetchFavorites,
                        child: InkWell(
                          onTap: () async {
                            await showSearch(
                              context: context,
                              delegate: SearchPage(),
                            );
                          },
                          child: Image.asset(
                            'assets/images/login/Search.png',
                            width: 28.w,
                            height: 28.h,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Consumer<MyListProvider>(
                        builder: (_, provider, __) {
                          return provider.favoriteMovies.isEmpty
                              ? const EmptyData()
                              : GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 8.0,
                                    crossAxisSpacing: 8.0,
                                    childAspectRatio: 0.7,
                                  ),
                                  itemCount: provider.favoriteMovies.length,
                                  itemBuilder: (context, index) {
                                    final movie =
                                        provider.favoriteMovies[index];
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(20.r),
                                      child: Image.network(
                                        'https://image.tmdb.org/t/p/w500${movie['backdrop_path']}',
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                        height: 150.h,
                                      ),
                                    );
                                  },
                                );
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
