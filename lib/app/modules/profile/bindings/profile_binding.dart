import '../controllers/profile_controller.dart';

import '../data/repository/profile_repository.dart';
import 'package:get/get.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<ProfileRepository>(
      () => ProfileRepository(),
    );
  }
}
