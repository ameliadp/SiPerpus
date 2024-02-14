import 'package:get/get.dart';
import '../data/repository/profile_repository.dart';
import '../../utils/utils.dart';

class ProfileController extends GetxController {
  final ProfileRepository profileRepository = Get.find();
  UserModel? user;

  @override
  void onReady() {
    getProfile();
  }

  Future<UserModel?> getProfile() async {
    try {
      final UserModel? res = await profileRepository.getProfile();
      user = res;
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
    return null;
  }
}
