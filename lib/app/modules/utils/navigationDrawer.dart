import 'package:digitallibrary/app/modules/saved/views/saved_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../routes/app_pages.dart';
import 'utils.dart';

class NavigationDrawerWidget extends StatefulWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final RxBool isHovered = false.obs;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: colorPrimary,
        child: ListView(
          children: <Widget>[
            buildMenuItem(
              text: '',
              image: 'assets/images/garis.png',
              onClicked: () {
                Get.back();
              },
            ),
            73.height,
            buildMenuItem(
              text: 'Home',
              image: 'assets/images/home.png',
              onClicked: () => selectedItem(context, 0),
            ),
            buildMenuItem(
              text: 'Library',
              image: 'assets/images/library.png',
              onClicked: () => selectedItem(context, 1),
            ),
            buildMenuItem(
              text: 'My List',
              image: 'assets/images/list.png',
              onClicked: () => selectedItem(context, 2),
            ),
            buildMenuItem(
              text: 'Saved',
              image: 'assets/images/saved.png',
              onClicked: () => selectedItem(context, 5),
            ),
            buildMenuItem(
              text: 'Profile',
              image: 'assets/images/profile.png',
              onClicked: () => selectedItem(context, 3),
            ),
            355.height,
            buildMenuItem(
              text: 'Logout',
              image: 'assets/images/logout.png',
              onClicked: () => selectedItem(context, 6),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required String image,
    VoidCallback? onClicked,
  }) {
    const color = colorwhite;
    const hoverColor = Colors.white;

    return InkWell(
      onTap: onClicked,
      onHover: (hovering) => isHovered.value = hovering,
      child: Container(
        color: isHovered.value ? hoverColor : Colors.transparent,
        child: ListTile(
          leading: Image.asset(
            image,
            fit: BoxFit.contain,
            width: 28.0,
          ),
          title: Text(
            text,
            style: GoogleFonts.quicksand(color: color, fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}

void selectedItem(BuildContext context, int Index) {
  Get.back();

  switch (Index) {
    case 0:
      Get.toNamed(Routes.HOME);
      break;
    case 1:
      Get.toNamed(Routes.LIBRARY);
      break;
    case 2:
      Get.toNamed(Routes.MY_LIST);
      break;
    case 3:
      Get.toNamed(Routes.PROFILE);
      break;
    case 4:
      Get.toNamed(Routes.LOGIN);
      break;
    case 5:
      Get.toNamed(Routes.SAVED);
      break;
    case 6:
      logout(context);
      break;
  }
}

void logout(BuildContext context) {
  Get.defaultDialog(
    contentPadding: const EdgeInsets.all(16.0),
    title: 'Logout',
    titleStyle:
        GoogleFonts.quicksand(color: colorFourd, fontWeight: FontWeight.w400),
    middleText: 'Are you sure, you want to logout?',
    middleTextStyle: GoogleFonts.quicksand(
      color: colorFourd,
      fontSize: 17.0,
    ),
    actions: [
      Align(
        alignment: Alignment.bottomRight,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: colorPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 4.0,
                vertical: 2.0,
              ),
              fixedSize: const Size(80, 2)),
          onPressed: () async {
            Get.back();
            await StorageService.instance.clearUser();
            Get.offAllNamed(Routes.LOGIN);
          },
          child: Text(
            'Yes',
            style: GoogleFonts.quicksand(color: colorwhite, fontSize: 14.0),
          ),
        ),
      ),
    ],
  );
}
