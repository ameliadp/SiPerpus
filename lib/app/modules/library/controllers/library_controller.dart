import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../home/data/data.dart';
import '../../utils/utils.dart';

class LibraryController extends GetxController {
  final HomeRepository homeRepository = Get.find<HomeRepository>();
  List<BookModel> books = [];
  CategoryModel? selectedCategory;
  List<CategoryModel> categories = [];

  @override
  void onReady() async {
    await (
      getCategories(),
      getBooksByCategory(),
    ).wait;
  }

  Future<void> onSelectCategory(CategoryModel category) async {
    try {
      showLoading();
      selectedCategory = category;
      update();
      books =
          await homeRepository.getBooksByCategory(category.categoryId ?? '');
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

  Future<void> getBooksByCategory() async {
    try {
      books = await homeRepository.getBooksByCategory('');
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
    } finally {}
  }

  Future<void> getCategories() async {
    try {
      showLoading();
      categories = await homeRepository.getCategories();
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

  void gotoDetailBook(String? bookId) {
    if (bookId == null) return;
    Get.toNamed(Routes.DETAIL, arguments: bookId);
  }
}
