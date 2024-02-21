import '../../utils/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../home/data/data.dart';
import '../../home/widgets/widgets.dart';
import '../../library/widgets/widgets.dart';
import '../controllers/top_book_controller.dart';

class TopBookView extends GetView<TopBookController> {
  const TopBookView({Key? key}) : super(key: key);
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: SizedBox(
                  height: 35.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Stack(
                      children: [
                        GetBuilder<TopBookController>(
                          builder: (controller) => ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: controller.categories.length,
                            itemBuilder: (context, index) {
                              final CategoryModel category =
                                  controller.categories[index];
                              return CategoryItem(
                                category: category,
                                isActive:
                                    controller.selectedCategory?.categoryId ==
                                        category.categoryId,
                                onPress: () {
                                  controller.onSelectCategory(category);
                                },
                              );
                            },
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            width: 10.0,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              20.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: GetBuilder<TopBookController>(
                  builder: (controller) => GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 27.0,
                      mainAxisSpacing: 12.0,
                      childAspectRatio:
                          0.6, // Adjust the aspect ratio as needed
                    ),
                    itemCount: controller.books.length,
                    itemBuilder: (context, index) {
                      final BookModel book = controller.books[index];
                      return BookItem(
                        book: book,
                        onPress: () {
                          controller.gotoDetailBook(book.bookId);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
