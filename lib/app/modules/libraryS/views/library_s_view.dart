import 'package:digitallibrary/app/modules/home/data/data.dart';
import 'package:digitallibrary/app/modules/library/views/library_view.dart';
import 'package:digitallibrary/app/modules/utils/saved_provider.dart';
import 'package:digitallibrary/app/modules/home/widgets/BookItem.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../controllers/library_s_controller.dart';

class LibrarySView extends GetView<LibrarySController> {
  final LibrarySController controller = Get.put(LibrarySController());

  LibrarySView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SavedProvider(),
      child: Consumer<SavedProvider>(
        builder: (context, savedProvider, _) {
          return ListView.builder(
            itemCount: controller.books.length,
            itemBuilder: (context, index) {
              final BookModel book = controller.books[index];
              return BookItem(
                book: book,
                onPress: () => controller.gotoDetailBook(book.bookId),
              );
            },
          );
        },
      ),
    );
  }
}
