import '../../utils/utils.dart';
import '../data/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import '../controllers/home_controller.dart';
import '../widgets/widgets.dart';

class HomeView extends GetView<HomeController> {
  final zoomDrawer = ZoomDrawerController();
  HomeView({super.key});

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
        toolbarHeight: 50.0,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            'Home',
            style: GoogleFonts.quicksand(
                color: colorFourd, fontSize: 25.0, fontWeight: FontWeight.w700),
          ),
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
        elevation: 3,
        shadowColor: colorgrey,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                child: Container(
                  alignment: Alignment.topRight,
                  child: GetBuilder<HomeController>(
                    builder: (controller) => Text(
                      'Hai, ${controller.user?.value.userName}!',
                      style: GoogleFonts.quicksand(
                        color: colorFourd,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
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
                    // TextButton(
                    //   onPressed: () {
                    //     Get.toNamed(Routes.TOP_BOOK);
                    //   },
                    //   child: Text(
                    //     'See All',
                    //     style: GoogleFonts.quicksand(
                    //         color: const Color(0xff89AEF4), fontSize: 15.0),
                    //   ),
                    // ),
                  ],
                ),
              ),
              5.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  height: 209,
                  child: GetBuilder<HomeController>(
                    builder: (controller) => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.popularBooks.length,
                      itemBuilder: (context, index) {
                        final BookModel book = controller.popularBooks[index];
                        return Stack(
                          children: [
                            TopBookItem(
                              book: book,
                              onPress: () {
                                controller.gotoDetailBook(book.bookId);
                              },
                            ),
                            Positioned(
                              top: 12,
                              right: 14,
                              child: CircleAvatar(
                                backgroundColor: colorwhite,
                                radius: 10.0,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              bottom: 164,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.bookmark_border,
                                  size: 10.0,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
              18.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Other Books'.toUpperCase(),
                    style: GoogleFonts.quicksand(
                        color: colorFourd,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              15.height,
              Padding(
                padding: const EdgeInsets.only(right: 18.0, left: 18.0),
                child: GetBuilder<HomeController>(
                  builder: (controller) => GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 27.0,
                      mainAxisSpacing: 12.0,
                      childAspectRatio: 0.6,
                    ),
                    itemCount: controller.books.length,
                    itemBuilder: (context, index) {
                      final BookModel book = controller.books[index];
                      return Stack(
                        children: [
                          BookItem(
                            book: book,
                            onPress: () {
                              controller.gotoDetailBook(book.bookId);
                            },
                          ),
                          Positioned(
                            top: 7,
                            right: 15,
                            child: CircleAvatar(
                              backgroundColor: colorwhite,
                              radius: 13.0,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 4,
                            bottom: 208,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.bookmark_border,
                                size: 16.0,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
