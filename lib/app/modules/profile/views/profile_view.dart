import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import '../controllers/profile_controller.dart';
import '../../utils/color.dart';
import '../data/data.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  final ProfileController controller =
      Get.put<ProfileController>(ProfileController(
    profileRepository: Get.put<ProfileRepository>((ProfileRepository())),
  ));
  ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 35.0,
          leading: IconButton(
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 17.0, left: 20.0),
              child: Text(
                'Profile',
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
                        top: 17.0, left: 25.0, right: 25.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, left: 10.0, right: 10.0),
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
                                Text(
                                  '${controller.user?.value.email}',
                                  style: GoogleFonts.quicksand(
                                    color: colorblack,
                                    fontSize: 16.0,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
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
                                top: 20.0, left: 10.0, right: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nama Lengkap',
                                  style: GoogleFonts.quicksand(
                                      color: colorgrey, fontSize: 15.0),
                                ),
                                2.height,
                                Text(
                                  '${controller.user?.value.userName}',
                                  style: GoogleFonts.quicksand(
                                    color: colorblack,
                                    fontSize: 16.0,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
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
                                top: 20.0, left: 10.0, right: 10.0),
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
                                Text(
                                  '${controller.user?.value.address}',
                                  style: GoogleFonts.quicksand(
                                    color: colorblack,
                                    fontSize: 16.0,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
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
