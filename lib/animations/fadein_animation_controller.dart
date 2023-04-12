// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:aqualotl/pages/authentication/signup/auth.dart';
import 'package:get/get.dart';

import '../pages/authentication/welcomescreen.dart';

class tFadeInAnimationController extends GetxController {
  static tFadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;

  Future startSplashAnimation() async {
    await Future.delayed(Duration(milliseconds: 1200));
    animate.value = true;
    await Future.delayed(Duration(milliseconds: 3000));
    animate.value = false;
    await Future.delayed(Duration(milliseconds: 2500));
    Get.offAll(() => const Auth());
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;
  }
}
