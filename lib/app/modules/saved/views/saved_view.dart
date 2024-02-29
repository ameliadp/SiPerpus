import 'package:digitallibrary/app/modules/home/data/data.dart';
import 'package:digitallibrary/app/modules/home/widgets/BookItem.dart';
import 'package:digitallibrary/app/modules/utils/color.dart';
import 'package:digitallibrary/app/modules/utils/saved_provider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../controllers/saved_controller.dart';

class SavedView extends GetView<SavedController> {
  const SavedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SavedProvider>(context);
    final words = provider.saveBooks;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.0,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Saved',
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 27.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 0.6,
          ),
          itemCount: provider.saveBooks.length,
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
    );
  }
}
