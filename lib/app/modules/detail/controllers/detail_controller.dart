import '../../home/data/models/models.dart';
import '../../home/data/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../../utils/utils.dart';

class DetailController extends GetxController {
  final String bookId = Get.arguments;
  final HomeRepository homeRepository = Get.find<HomeRepository>();
  BookModel? book;

  @override
  void onReady() {
    super.onReady();
    getBook();
  }

  Future<void> getBook() async {
    try {
      showLoading();
      book = await homeRepository.getBook(bookId);
      update();
    } on String catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          message: e,
          backgroundColor: colorRed,
          duration: const Duration(seconds: 1),
          isDismissible: true,
        ),
      );
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          message: "Failed to get detail book",
          backgroundColor: colorRed,
          duration: Duration(seconds: 1),
          isDismissible: true,
        ),
      );
    } finally {
      dismissLoading();
    }
  }

  Future<void> borrowBook() async {
    showBorrowDialog(processBorrowedBook);
  }

  Future<void> processBorrowedBook() async {
    try {
      showLoading();
      String resMessage = await homeRepository.borrowBook(bookId);
      Get.showSnackbar(
        GetSnackBar(
          message: resMessage,
          backgroundColor: colorPrimary,
          duration: const Duration(seconds: 1),
          isDismissible: true,
        ),
      );
      Get.offNamed(Routes.MY_LIST);
    } on String catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          message: e,
          backgroundColor: colorRed,
          duration: const Duration(seconds: 1),
          isDismissible: true,
        ),
      );
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          message: "Failed to get detail book",
          backgroundColor: colorRed,
          duration: Duration(seconds: 1),
          isDismissible: true,
        ),
      );
    } finally {
      dismissLoading();
    }
  }
}

void showBorrowDialog(VoidCallback onPress) {
  Get.defaultDialog(
    contentPadding: const EdgeInsets.all(16.0),
    title: 'Borrow Book',
    titleStyle:
        GoogleFonts.quicksand(color: colorFourd, fontWeight: FontWeight.w400),
    middleText: 'Are you sure, want to borrow this book?',
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
          onPressed: () {
            Get.back();
            onPress();
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
