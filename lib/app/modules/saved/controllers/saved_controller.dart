import '../../home/controllers/home_controller.dart';
import '../../home/data/data.dart';
import '../data/repository/saved_repository.dart';
import '../../../routes/app_pages.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';

class SavedController extends GetxController {
  final SavedRepository savedRepository = Get.find();
  final HomeController homeRepository = Get.find();
  List<BookModel> books = [];

  @override
  void onReady() {
    super.onReady();
    getSavedBooks();
  }

  void gotoDetailBook(String? bookId) {
    if (bookId == null) return;
    Get.toNamed(Routes.DETAIL, arguments: bookId);
  }

  Future<void> getSavedBooks() async {
    try {
      showLoading();
      books = await savedRepository.getSavedBooks();
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
          message: "Failed to get saved books",
          backgroundColor: colorRed,
          duration: Duration(seconds: 1),
          isDismissible: true,
        ),
      );
    } finally {
      dismissLoading();
    }
  }

  Future<void> removeFromSaveBooks(String collectionId) async {
    try {
      showLoading();
      await savedRepository.removeFromSaveBook(collectionId);
      Get.showSnackbar(
        const GetSnackBar(
          message: "Successfully remove book",
          backgroundColor: colorPrimary,
          duration: Duration(seconds: 1),
          isDismissible: true,
        ),
      );
      getSavedBooks();
      homeRepository.getBooks();
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
          message: "Failed to get saved books",
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
