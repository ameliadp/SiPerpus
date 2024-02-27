import 'package:digitallibrary/app/modules/home/data/data.dart';
import 'package:digitallibrary/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LibrarySController extends GetxController {
  List<BookModel> books = [];

  void gotoDetailBook(String? bookId) {
    if (bookId == null) return;
    Get.toNamed(Routes.DETAIL, arguments: bookId);
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
