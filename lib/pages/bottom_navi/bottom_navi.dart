import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/app/const/accout.dart';
import 'package:movie_app/app/helper/share_pre.dart';
import 'package:movie_app/pages/download/download_page.dart';
import 'package:movie_app/pages/explore/explore_page.dart';
import 'package:movie_app/pages/home/home_page.dart';
import 'package:movie_app/pages/my_list/my_list_page.dart';
import 'package:movie_app/pages/profile/profile_page.dart';
import 'package:movie_app/provider/home_provider.dart';
import 'package:movie_app/provider/setting_app_provider.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class BottomNavi extends StatefulWidget {
  const BottomNavi({super.key});

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
  int selectedIndex = 0;
  List<Widget> body = [
    const HomePage(),
    const ExplorePage(),
    const MyListPage(),
    const DownloadPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    //
    super.initState();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      context.read<HomeProvider>().updateNotificationCount();

      DocumentReference notification = FirebaseFirestore.instance
          .collection('notification')
          .doc(context.read<SettingAppProvider>().uId);

      notification.collection('notificationData').add({
        'time': DateTime.now(),
        'body': message.notification?.body ?? '',
        'title': message.notification?.title ?? '',
      }).then((value) {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.info(message: message.notification?.body ?? ''),
        );
      }).catchError((error) => print("Failed to add user: $error"));
    });
    updateUser();
  }

  void updateUser() async {
    String uID = await SharePre.getString(Accout.keyUserId);

    if (uID != '') {
      context.read<SettingAppProvider>().updateUid(uID);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[selectedIndex],
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
