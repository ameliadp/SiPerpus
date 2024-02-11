import '../data/models/book_model.dart';
import '../data/repository/home_repository.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';

class HomeController extends GetxController {
  final HomeRepository homeRepository;
  HomeController({required this.homeRepository});

  List<BookModel> books = [];
  List<BookModel> popularBooks = [];

  @override
  void onInit() {
    super.onInit();
    Future.wait([
      getBooks(),
      getPopularBooks(),
    ]);
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
}
