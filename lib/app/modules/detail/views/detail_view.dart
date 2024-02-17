import '../widgets/review_item.dart';
import '../../home/data/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../utils/utils.dart';
import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimary,
      appBar: AppBar(
        backgroundColor: colorPrimary,
        toolbarHeight: 35.0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: colorwhite,
            size: 20.0,
          ),
        ),
      ),
      body: GetBuilder<DetailController>(
        builder: (controller) => Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height / 2 + 230,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(50.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 95.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              '${controller.book?.title}',
                              style: GoogleFonts.quicksand(
                                color: colorFourd,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          10.height,
                          Container(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Writer',
                                      style: GoogleFonts.quicksand(
                                          color: colordarkgrey, fontSize: 16.0),
                                    ),
                                    74.width,
                                    Text(':',
                                        style: GoogleFonts.quicksand(
                                            color: colordarkgrey,
                                            fontSize: 16.0)),
                                    8.width,
                                    Text('${controller.book?.writer}',
                                        style: GoogleFonts.quicksand(
                                            color: colordarkgrey,
                                            fontSize: 16.0))
                                  ],
                                ),
                                10.height,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Publisher',
                                        style: GoogleFonts.quicksand(
                                            color: colordarkgrey,
                                            fontSize: 16.0)),
                                    54.width,
                                    Text(':',
                                        style: GoogleFonts.quicksand(
                                            color: colordarkgrey,
                                            fontSize: 16.0)),
                                    8.width,
                                    Text('${controller.book?.publisher}',
                                        style: GoogleFonts.quicksand(
                                            color: colordarkgrey,
                                            fontSize: 16.0))
                                  ],
                                ),
                                10.height,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Publication Year',
                                        style: GoogleFonts.quicksand(
                                            color: colordarkgrey,
                                            fontSize: 16.0)),
                                    13.width,
                                    Text(':',
                                        style: GoogleFonts.quicksand(
                                            color: colordarkgrey,
                                            fontSize: 16.0)),
                                    8.width,
                                    Text('${controller.book?.yearPublication}',
                                        style: GoogleFonts.quicksand(
                                            color: colordarkgrey,
                                            fontSize: 16.0))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          7.height,
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Color(0xffFFD233),
                                  size: 23.0,
                                ),
                                Text(
                                  '${controller.book?.rating}/5',
                                  style: GoogleFonts.quicksand(
                                      color: colordarkgrey, fontSize: 17),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Synopsis',
                                      style: GoogleFonts.quicksand(
                                          color: colordarkgrey, fontSize: 16.0),
                                    ),
                                    55.width,
                                    Text(
                                      ':',
                                      style: GoogleFonts.quicksand(
                                          color: colordarkgrey, fontSize: 16.0),
                                    )
                                  ],
                                ),
                                8.height,
                                ReadMoreText(
                                  '${controller.book?.synopsis}',
                                  trimLines: 5,
                                  colorClickableText: colorPrimary,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: '...Read More',
                                  trimExpandedText: ' Show Less',
                                  style: GoogleFonts.quicksand(
                                      color: colordarkgrey, fontSize: 14.0),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                          25.height,
                          Padding(
                            padding: const EdgeInsets.only(bottom: 60.0),
                            child: Container(
                              height: 170.0,
                              decoration:
                                  const BoxDecoration(color: colorSecondary),
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, top: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Text('Review'.toUpperCase(),
                                          style: GoogleFonts.quicksand(
                                              color: colorFourd,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    SizedBox(
                                      height: 120.0,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: controller
                                                .book?.reviews?.length,
                                            itemBuilder: (context, index) {
                                              final Review? review = controller
                                                  .book?.reviews?[index];
                                              return ReviewItem(review: review);
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 125,
              right: 125,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7.0),
                child: GetBuilder<DetailController>(
                  builder: (controller) => SizedBox(
                    height: 170,
                    child: Image.network(
                      // 'assets/images/cover3.jpeg',
                      URL.imageUrl(controller.book?.thumbnail ?? ""),
                      // width: double.infinity,
                      height: 200,
                      errorBuilder: (context, error, stackTrace) =>
                          const SizedBox(
                        height: 200,
                        child: Icon(Icons.error),
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 654.0,
              right: 20.0,
              child: controller.book?.status ?? true
                  ? const SizedBox()
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 2,
                        shadowColor: colorgrey,
                        fixedSize: const Size(110, 20),
                        backgroundColor: colorPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 2.0),
                      ),
                      onPressed: controller.borrowBook,
                      child: Text(
                        'Borrow Book'.toUpperCase(),
                        style: GoogleFonts.quicksand(
                            color: colorwhite, fontSize: 12.0),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
