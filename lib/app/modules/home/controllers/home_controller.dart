import '../../saved/data/repository/saved_repository.dart';
import '../../../routes/app_pages.dart';

import '../data/models/book_model.dart';
import '../data/repository/home_repository.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';

class HomeController extends GetxController {
  final HomeRepository homeRepository =
      Get.put<HomeRepository>(HomeRepository());
  final SavedRepository savedRepository =
      Get.put<SavedRepository>(SavedRepository());
  List<BookModel> books = [];
  List<BookModel> popularBooks = [];
  Rx<UserModel>? user;

  @override
  void onReady() async {
    showLoading();
    await (
      getDetailUser(),
      getBooks(),
      getPopularBooks(),
    ).wait;
    update();
    dismissLoading();
  }

  Future<void> getDetailUser() async {
    try {
      final UserModel res = await homeRepository.getDetailUser();
      user = res.obs;
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
    }
  }

  Future<void> getBooks() async {
    try {
      books = await homeRepository.getBooks();
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
    }
  }

  Future<void> getPopularBooks() async {
    try {
      popularBooks = await homeRepository.getPopularBooks();
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
    }
  }

  Future<void> savedBook(BookModel book) async {
    try {
      showLoading();
      if (book.isSave) {
        await savedRepository.removeFromSaveBook(book.collectionId ?? "");
        Get.showSnackbar(
          const GetSnackBar(
            message: "Successfully remove book",
            backgroundColor: colorPrimary,
            duration: Duration(seconds: 1),
            isDismissible: true,
          ),
        );
        getBooks();
        return;
      }

      await savedRepository.savedBook(book.bookId ?? "");
      Get.showSnackbar(
        const GetSnackBar(
          message: "Successfully save book",
          backgroundColor: colorPrimary,
          duration: Duration(seconds: 1),
          isDismissible: true,
        ),
      );

      getBooks();
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

  void gotoDetailBook(String? bookId) {
    if (bookId == null) return;
    Get.toNamed(Routes.DETAIL, arguments: bookId);
  }
}
