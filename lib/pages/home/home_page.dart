import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app/setting_app.dart';
import 'package:movie_app/pages/notification/notification_page.dart';
import 'package:movie_app/pages/see_all/see_all_page.dart';
import 'package:movie_app/widgets/button_main_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/login/DrStrange2.png',
                  fit: BoxFit.cover,
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/login/LogoM.png',
                          width: 32.w,
                          height: 32.h,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/login/Search.png',
                              fit: BoxFit.cover,
                            ),
                            20.horizontalSpace,
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NotificationPage(),
                                  ),
                                );
                              },
                              child: Image.asset(
                                'assets/images/login/Notification.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 24,
                  left: 24,
                  child: SizedBox(
                    width: 211,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. Strange 2',
                          style: SettingApp.heding1.copyWith(fontSize: 24.sp),
                        ),
                        8.verticalSpace,
                        Text(
                          'Action, Superhero, Science Fiction, ...',
                          style: SettingApp.heding3.copyWith(fontSize: 12.sp),
                        ),
                        8.verticalSpace,
                        Row(
                          children: [
                            Expanded(
                              child: ButtonMainCustom(
                                onTap: () {},
                                isShowIconLeft: true,
                                iconLeft: const Icon(Icons.play_circle),
                                title: 'Play',
                              ),
                            ),
                            12.horizontalSpace,
                            Expanded(
                              child: ButtonMainCustom(
                                onTap: () {},
                                isShowIconLeft: true,
                                backgroundColor: Colors.transparent,
                                borderWidth: 2,
                                borderColor: const Color(0xffFFFFFF),
                                iconLeft: const Icon(Icons.add),
                                title: 'My List',
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            24.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Top 10 Movies This Week',
                          style: SettingApp.heding1.copyWith(fontSize: 20.sp),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SeeAllPage(),
                            ),
                          );
                        },
                        child: Text(
                          'See all',
                          style: SettingApp.heding2.copyWith(
                            fontSize: 14.sp,
                            color: const Color(0xffE21221),
                          ),
                        ),
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  SizedBox(
                    height: 200.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 100.w,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.lightGreenAccent,
                          ),
                        );
                      },
                    ),
                  ),
                  16.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'New Releases',
                          style: SettingApp.heding1.copyWith(fontSize: 20.sp),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SeeAllPage(),
                            ),
                          );
                        },
                        child: Text(
                          'See all',
                          style: SettingApp.heding2.copyWith(
                            fontSize: 14.sp,
                            color: const Color(0xffE21221),
                          ),
                        ),
                      ),
                    ],
                  ),
                  16.verticalSpace,
                  SizedBox(
                    height: 200.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 7,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: 100.w,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.lightGreenAccent,
                          ),
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Color(0xff9E9E9E),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore,
              color: Color(0xff9E9E9E),
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark,
              color: Color(0xff9E9E9E),
            ),
            label: 'My List',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.cloud_download,
              color: Color(0xff9E9E9E),
            ),
            label: 'Download',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Color(0xff9E9E9E),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
