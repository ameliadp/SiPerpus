import '../../login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  // final storage = GetStorage();
  Widget nextScreen = LoginView();

  final count = 0.obs;

  void increment() => count.value++;
}
