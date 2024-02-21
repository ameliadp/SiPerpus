import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import '../controllers/profile_controller.dart';
import '../../utils/color.dart';
import '../data/data.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 50.0,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Profile',
              style: GoogleFonts.quicksand(
                  color: colorPrimary,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w700),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 12.0, bottom: 8.0),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: colorPrimary,
                size: 20.0,
              ),
            ),
          ),
          elevation: 3,
          shadowColor: colorgrey,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0),
              child: Text(
                'Borrower Data',
                style: GoogleFonts.quicksand(
                    color: colorFourd,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0),
              ),
            ),
            GetBuilder<ProfileController>(
              builder: (controller) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 20.0, right: 20.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 15.0, left: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: GoogleFonts.quicksand(
                                      color: colorgrey, fontSize: 15.0),
                                ),
                                2.height,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        '${controller.user?.email}',
                                        style: GoogleFonts.quicksand(
                                          color: colorblack,
                                          fontSize: 16.0,
                                        ),
                                      ),
                                    ),
                                    10.width,
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.edit_outlined,
                                        color: colorPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          4.height,
                          const Divider(
                            color: colorPrimary,
                            height: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 5.0, right: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Username',
                                  style: GoogleFonts.quicksand(
                                      color: colorgrey, fontSize: 15.0),
                                ),
                                2.height,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.user?.userName}',
                                      style: GoogleFonts.quicksand(
                                        color: colorblack,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          4.height,
                          const Divider(
                            color: colorPrimary,
                            height: 1,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, left: 5.0, right: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Alamat',
                                  style: GoogleFonts.quicksand(
                                      color: colorgrey, fontSize: 15.0),
                                ),
                                2.height,
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.user?.address}',
                                      style: GoogleFonts.quicksand(
                                        color: colorblack,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          4.height,
                          const Divider(
                            color: colorPrimary,
                            height: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
