// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hamarasehyog/components/big_tex.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/image_strings.dart';
import 'package:hamarasehyog/utils/text_strings.dart';
import 'package:hamarasehyog/views/splash%20screen/splash_screen_controller.dart';
// import 'package:hamarasehyog/views/sign_up.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    splashScreenController.startAnimation();
    return Scaffold(
      body: Center(
        child: Image.asset(appLogo1),
      )
    //Stack(children: [
    //   Obx(() => AnimatedPositioned(
    //         duration: const Duration(milliseconds: 1000),
    //         top: splashScreenController.animate.value ? 0 : -30,
    //         left: splashScreenController.animate.value ? 0 : -30,
    //         child: SvgPicture.asset(blob1)),
    //   ),
    //   Obx(() => AnimatedPositioned(
    //       duration: const Duration(milliseconds: 1000),
    //       top: 30,
    //       left: splashScreenController.animate.value ? 0 : -80,
    //       child: AnimatedOpacity(
    //         duration: const Duration(milliseconds: 1000),
    //         opacity: splashScreenController.animate.value ? 1 : 0,
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             SizedBox(
    //               height: 80,
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 25.0),
    //               child: BigText(
    //                   text: appName, color: AppColors.primaryBlack, size: 40),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.symmetric(horizontal: 25),
    //                 child: BigText(
    //                   text: "Together We Can",
    //                   color: AppColors.primaryBlack,
    //                   size: 30,
    //                   weight: FontWeight.w400,
    //               ),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.symmetric(horizontal: 25),
    //                 child: BigText(
    //                   text: "Make the Society",
    //                   color: AppColors.primaryBlack,
    //                   size: 30,
    //                   weight: FontWeight.w400,
    //                 ),
    //               ),
    //             Padding(
    //               padding: EdgeInsets.symmetric(horizontal: 25),
    //                 child: BigText(
    //                   text: "Worth Living",
    //                   color: AppColors.primaryBlack,
    //                   size: 30,
    //                   weight: FontWeight.w400,
    //                 ),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    //   Obx(() => AnimatedPositioned(
    //       duration: const Duration(milliseconds: 1000),
    //       top: 300,
    //       right: splashScreenController.animate.value ? -140 : -200,
    //       // bottom: animate? 80:0,
    //       child: AnimatedOpacity(
    //         duration: const Duration(milliseconds: 1000),
    //         opacity: splashScreenController.animate.value ? 1 : 0,
    //         child: SvgPicture.asset(illustration1, height: 400),
    //       ),
    //     ),
    //   ),
    // ]
    // ,)
  ,);
  }
}
