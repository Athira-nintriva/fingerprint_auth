import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void onInit() async {
    await animationInitilization();
    super.onInit();
  }

  animationInitilization() async {
      Timer(const Duration(seconds: 5), () {
        Get.offAllNamed('/login');
      // if (accessToken != null) {
      //   Get.offAndToNamed('/main_layout_screen', arguments: {'index': 0});
      // } else {
      //   Get.offAndToNamed('/signin_screen');
      // }
    });
    update();
  }

}
