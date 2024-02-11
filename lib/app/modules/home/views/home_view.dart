import '../../utils/utils.dart';
import '../../../routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final zoomDrawer = ZoomDrawerController();

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: const ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0)),
              child: NavigationDrawerWidget())),
      appBar: AppBar(
        backgroundColor: colorwhite,
        toolbarHeight: 45.0,
        title: Text(
          'Home',
          style: GoogleFonts.quicksand(
              color: colorFourd, fontSize: 25.0, fontWeight: FontWeight.w700),
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu_rounded,
                color: colorPrimary,
                size: 30.0,
              ),
            );
          },
        ),
        elevation: 4,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Hai, Awa!',
                    style: GoogleFonts.quicksand(
                      color: colorFourd,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Book'.toUpperCase(),
                      style: GoogleFonts.quicksand(
                        color: colorFourd,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.TOP_BOOK);
                      },
                      child: Text(
                        'See All',
                        style: GoogleFonts.quicksand(
                            color: const Color(0xff89AEF4), fontSize: 15.0),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  height: 209,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.DETAIL);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5.0),
                          width: 100,
                          height: 240,
                          child: Column(
                            children: [
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.asset(
                                    'assets/images/cover3.jpeg',
                                    width: 130,
                                    height: 140,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              10.height,
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 6.0, right: 6.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'The Trouble With Perfect',
                                      style: GoogleFonts.quicksand(
                                          color: colorblack,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Color(0xffFFD233),
                                          size: 20.0,
                                        ),
                                        Text(
                                          '4.5/5',
                                          style: GoogleFonts.quicksand(
                                              color: colordarkgrey,
                                              fontSize: 13),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              18.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Most Popular'.toUpperCase(),
                    style: GoogleFonts.quicksand(
                        color: colorFourd,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              15.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 27.0,
                    mainAxisSpacing: 12.0,
                    childAspectRatio: 0.6, // Adjust the aspect ratio as needed
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        Get.toNamed(Routes.DETAIL);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: SizedBox(
                          // decoration: BoxDecoration(color: colorPrimary),
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 200,
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset(
                                  'assets/images/cover3.jpeg',
                                  // width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              10.height,
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 6.0, right: 6.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'The Trouble With Perfect',
                                      style: GoogleFonts.quicksand(
                                          color: colorblack,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Color(0xffFFD233),
                                          size: 20.0,
                                        ),
                                        Text(
                                          '4.5/5',
                                          style: GoogleFonts.quicksand(
                                              color: colordarkgrey,
                                              fontSize: 13),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
