import 'package:digitallibrary/app/modules/utils/saved_provider.dart';
import 'package:provider/provider.dart';

import 'app/modules/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SavedProvider(),
        builder: (context, child) {
          return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Application",
        initialRoute: AppPages.INITIAL,
        builder: (context, child) => LoadingOverlayAlt(child: child!),
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
      );
        })
      ],
    ),
  );
}
