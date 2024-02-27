import 'package:get/get.dart';

import '../controllers/library_s_controller.dart';

class LibrarySBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LibrarySController>(
      () => LibrarySController(),
    );
  }
}
