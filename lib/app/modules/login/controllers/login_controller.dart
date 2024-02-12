import '../../utils/utils.dart';

import '../data/repository/auth_repository.dart';
import '../../../routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/models.dart';

class LoginController extends GetxController {
  final AuthRepository authRepository =
      Get.put<AuthRepository>(AuthRepository());
  final TextEditingController usernameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  final TextEditingController nameC = TextEditingController();
  final TextEditingController alamatC = TextEditingController();
  RxBool isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  final _isRegis = false.obs;
  bool get isRegis => _isRegis.value;
  set isRegis(value) => _isRegis.value = value;

  Future<void> login() async {
    try {
      showLoading();
      final ReqLoginModel reqLoginModel =
          ReqLoginModel(email: emailC.text, password: passC.text);
      final UserModel? res = await authRepository.login(reqLoginModel);
      if (res == null) {
        return;
      }

      Get.offAllNamed(Routes.HOME);
    } on String catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          title: "Login failed",
          message: e,
          backgroundColor: colorRed,
          duration: const Duration(seconds: 1),
          isDismissible: true,
        ),
      );
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          title: "Login failed",
          message: "Something went wrong with $e",
          backgroundColor: colorRed,
          duration: const Duration(seconds: 1),
          isDismissible: true,
        ),
      );
    } finally {
      dismissLoading();
    }
  }

  Future<void> register() async {
    try {
      showLoading();
      final ReqRegisterModel reqRegisterModel = ReqRegisterModel(
        email: emailC.text,
        password: passC.text,
        address: alamatC.text,
        userName: usernameC.text,
      );
      final String res = await authRepository.register(reqRegisterModel);
      clearAllController();
      Get.showSnackbar(
        GetSnackBar(
          message: res,
          backgroundColor: colorPrimary,
          isDismissible: true,
          mainButton: TextButton(
            child: const Text(
              'Login',
              style: TextStyle(color: colorwhite),
            ),
            onPressed: () {
              isRegis = false;
              Get.closeAllSnackbars();
            },
          ),
        ),
      );
    } on String catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          title: "Login failed",
          message: e,
          backgroundColor: colorRed,
          duration: const Duration(seconds: 1),
          isDismissible: true,
        ),
      );
    } catch (e) {
      // _myRouter.showSnackbar('Something went wrong with $e');
      Get.showSnackbar(
        GetSnackBar(
          title: "Login failed",
          message: "Something went wrong with $e",
          backgroundColor: colorRed,
          duration: const Duration(seconds: 1),
          isDismissible: true,
        ),
      );
    } finally {
      dismissLoading();
    }
  }

  void clearAllController() {
    emailC.clear();
    usernameC.clear();
    passC.clear();
    nameC.clear();
    alamatC.clear();
  }
}
