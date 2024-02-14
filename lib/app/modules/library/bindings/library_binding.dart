import 'package:get/get.dart';

import '../../home/data/repository/home_repository.dart';
import '../controllers/library_controller.dart';

class LibraryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LibraryController>(
      LibraryController(),
    );
    Get.lazyPut<HomeRepository>(() => HomeRepository());
  }
}
