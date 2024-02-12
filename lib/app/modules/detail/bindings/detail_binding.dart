import 'package:digitallibrary/app/modules/home/data/repository/repository.dart';
import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DetailController>(
      DetailController(),
    );
    Get.lazyPut<HomeRepository>(
      () => HomeRepository(),
    );
  }
}
