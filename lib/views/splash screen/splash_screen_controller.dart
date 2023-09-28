// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:hamarasehyog/services/auth/auth_gate.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(Duration(milliseconds: 2500));
    Get.offAll(AuthGate());
  }
}
