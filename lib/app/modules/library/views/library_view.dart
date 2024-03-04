import 'package:digitallibrary/app/modules/utils/saved_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../home/data/data.dart';
import '../widgets/category_item.dart';
import '../../utils/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../home/widgets/widgets.dart';
import '../controllers/library_controller.dart';

class LibraryView extends GetView<LibraryController> {
  final LibraryController controller = Get.put(LibraryController());
  LibraryView({super.key});
  @override
  Widget build(BuildContext context) {
    // final word = controller.books.toList();
    // final provider = Provider.of<SavedProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.0,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Library',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              child: SizedBox(
                height: 35.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Stack(
                    children: [
                      GetBuilder<LibraryController>(
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
            Padding(
              padding: const EdgeInsets.only(right: 18.0, left: 18.0),
              child: GetBuilder<LibraryController>(
                builder: (controller) => GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 27.0,
                    mainAxisSpacing: 12.0,
                    childAspectRatio: 0.6,
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
      ),
    );
  }
}
