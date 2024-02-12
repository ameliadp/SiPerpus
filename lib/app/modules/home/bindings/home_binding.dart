import '../controllers/home_controller.dart';
import '../data/repository/home_repository.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(),
    );
    Get.lazyPut<HomeRepository>(() => HomeRepository());
  }
}
