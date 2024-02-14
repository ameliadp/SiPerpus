import '../../routes/app_pages.dart';
import '../home/views/home_view.dart';
import '../myList/views/my_list_view.dart';
import '../profile/views/profile_view.dart';
import 'color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorThird,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  // Get.back();
                },
                child: Image.asset(
                  'assets/images/garis.png',
                  width: 20.0,
                  fit: BoxFit.contain,
                ),
              ),
              90.height,
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.HOME);
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/home.png',
                      width: 20.0,
                      fit: BoxFit.contain,
                    ),
                    5.width,
                    const Text(
                      'Home',
                      style: TextStyle(color: colorwhite, fontSize: 15.0),
                    )
                  ],
                ),
              ),
              10.height,
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.LIBRARY);
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/library.png',
                      width: 20.0,
                      fit: BoxFit.contain,
                    ),
                    5.width,
                    const Text(
                      'Library',
                      style: TextStyle(color: colorwhite, fontSize: 15.0),
                    )
                  ],
                ),
              ),
              10.height,
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.MY_LIST);
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/list.png',
                      width: 20.0,
                      fit: BoxFit.contain,
                    ),
                    5.width,
                    const Text(
                      'My List',
                      style: TextStyle(color: colorwhite, fontSize: 15.0),
                    )
                  ],
                ),
              ),
              10.height,
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.PROFILE);
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/profile.png',
                      width: 20.0,
                      fit: BoxFit.contain,
                    ),
                    5.width,
                    const Text(
                      'Profile',
                      style: TextStyle(color: colorwhite, fontSize: 15.0),
                    )
                  ],
                ),
              ),
              480.height,
              InkWell(
                onTap: () {
                  // const ProfileView();
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/logout.png',
                      width: 20.0,
                      fit: BoxFit.contain,
                    ),
                    5.width,
                    const Text(
                      'Logout',
                      style: TextStyle(color: colorwhite, fontSize: 15.0),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
