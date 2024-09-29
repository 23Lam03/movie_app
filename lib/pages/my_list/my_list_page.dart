import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/pages/download/download_page.dart';
import 'package:movie_app/pages/explore/explore_page.dart';
import 'package:movie_app/pages/home/home_page.dart';
import 'package:movie_app/pages/profile/profile_page.dart';

class MyListPage extends StatefulWidget {
  const MyListPage({super.key});

  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  int selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;

      if (index == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else if (index == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ExplorePage(),
          ),
        );
      } else if (index == 3) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DownloadPage(),
          ),
        );
      } else if (index == 4) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ProfilePage(),
          ),
        );
      }
    });
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
                    16.horizontalSpace,
                    Expanded(
                      child: Text(
                        'My List',
                        style: SettingApp.heding1.copyWith(fontSize: 24.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Image.asset(
                        'assets/images/login/Search.png',
                        width: 32.w,
                        height: 32.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                164.verticalSpace,
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/my_list/myList.png',
                        fit: BoxFit.cover,
                      ),
                      44.verticalSpace,
                      Text(
                        'Your List is Empty',
                        style: SettingApp.heding1.copyWith(
                          fontSize: 24.sp,
                          color: SettingApp.colorText,
                        ),
                      ),
                      15.verticalSpace,
                      Text(
                        'It seems that you haven`t added \n any movies to the list',
                        style: SettingApp.heding3.copyWith(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        currentIndex: selectedIndex,
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
