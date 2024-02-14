import 'dart:async';
import '../data/models/models.dart';
import '../data/repository/my_list_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/utils.dart';

class MyListController extends GetxController {
  var bottomSheetHeight = 900.0;
  TextEditingController ulasanC = TextEditingController();

  final MyListRepository myListRepository = Get.put(MyListRepository());
  List<BorrowedBook> borrowedBooks = [];

  @override
  void onReady() {
    super.onReady();
    getBorrowedBooks();
  }

  Future<void> submitReviewAndReturn(ReqSubmitReview reqSubmitReview) async {
    try {
      showLoading();
      String resSubmit = await myListRepository.submitReview(reqSubmitReview);
      Get.showSnackbar(
        GetSnackBar(
          message: resSubmit,
          backgroundColor: colorPrimary,
          duration: const Duration(seconds: 1),
          isDismissible: true,
        ),
      );
      String resReturn = await myListRepository
          .returnBook(reqSubmitReview.borrowId.toString());
      Get.showSnackbar(
        GetSnackBar(
          message: resReturn,
          backgroundColor: colorPrimary,
          duration: const Duration(seconds: 1),
          isDismissible: true,
        ),
      );
      getBorrowedBooks();
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
          message: "Failed to get most popular books",
          backgroundColor: colorRed,
          duration: Duration(seconds: 1),
          isDismissible: true,
        ),
      );
    } finally {
      dismissLoading();
    }
  }

  Future<void> getBorrowedBooks() async {
    try {
      showLoading();
      borrowedBooks = await myListRepository.getBorrowedBooks();
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
          message: "Failed to get most popular books",
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
