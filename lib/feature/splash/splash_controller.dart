import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth/login_auth.dart';

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
    Timer(const Duration(seconds: 5), () async {
      bool authenticated = await Authentication().authentication();
      if (authenticated != null) {
        debugPrint('Authentication successful');
        Get.offAllNamed('/dashboard');
      } else {
        Get.offAllNamed('/login');
      }
    });
    update();
  }
}
