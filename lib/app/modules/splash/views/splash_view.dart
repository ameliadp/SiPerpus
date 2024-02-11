import '../../utils/color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset(
            'assets/images/logoP.png',
            // width: 250.0,
            height: 220.0,
            fit: BoxFit.contain,
          ),
        ],
      ),
      backgroundColor: colorPrimary,
      nextScreen: controller.nextScreen,
      splashIconSize: 250,
      duration: 1000,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
