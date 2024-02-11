import '../data/repository/home_repository.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put<HomeController>(
    //   HomeController(homeRepository: Get.find<HomeRepository>()),
    // );
    Get.lazyPut<HomeRepository>(() => HomeRepository());
  }
}
