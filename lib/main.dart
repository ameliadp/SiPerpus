import 'app/modules/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      routingCallback: (value) async {
        final UserModel? user = await StorageService.instance.getUser();
        if (user?.token == null) {
          return Get.toNamed(Routes.LOGIN);
        }

        if (value?.current == Routes.SPLASH) {
          return Get.toNamed(Routes.HOME);
        }
      },
    ),
  );
}
