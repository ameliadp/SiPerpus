import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/models/models.dart';
import '../data/repository/profile_repository.dart';
import '../../utils/utils.dart';

class ProfileController extends GetxController {
  var labelColor = Colors.grey.obs;
  TextEditingController EmailC = TextEditingController();
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
      EmailC.text = res?.email ?? "";
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

  Future<UserModel?> updateProfile() async {
    try {
      showLoading();
      final UserModel? res = await profileRepository.updateProfile(
        ReqUpdateProfile(email: EmailC.text),
      );
      user = res;
      update();
      Get.showSnackbar(
        const GetSnackBar(
          message: "Update Profile Successfully",
          backgroundColor: colorPrimary,
          duration: Duration(seconds: 1),
          isDismissible: true,
        ),
      );
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
    return null;
  }
}
