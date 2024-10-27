import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/provider/my_list_provider.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchFavorites(
          "actual_authenticated_user_id"); // Replace with actual user ID
    });
  }

  void fetchFavorites(String userId) async {
    setState(() => _isLoading = true);
    await Provider.of<MyListProvider>(context, listen: false)
        .fetchFavoriteMovies(userId);
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
                        onTap: () => fetchFavorites(
                            "actual_authenticated_user_id"), // Refresh on tap
                        child: Image.asset(
                          'assets/images/login/Search.png',
                          width: 28.w,
                          height: 28.h,
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
                                    return Card(
                                      child: Column(
                                        children: [
                                          Image.network(
                                            movie['posterPath'],
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: 150.h,
                                          ),
                                          SizedBox(height: 8.h),
                                          Text(
                                            'Movie ID: ${movie['idMovie']}',
                                            style: TextStyle(fontSize: 14.sp),
                                          ),
                                        ],
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
