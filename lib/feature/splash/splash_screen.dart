import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashScreenController>(
        init: SplashScreenController(),
        builder: (controller) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  SvgPicture.asset('assets/svg/flutter-logo.svg'),
                  // Image.asset("assets/images/logo.png"),
                 
                  const SizedBox(
                    height: 15,
                  ),
                const Text("ACCRUON",
                      style: TextStyle(fontSize: 20,color: Colors.blue))
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
