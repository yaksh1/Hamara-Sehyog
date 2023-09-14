// ignore_for_file: use_build_context_synchronously, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hamarasehyog/components/on_boarding_page_widget.dart';
import 'package:hamarasehyog/components/small_text.dart';
import 'package:hamarasehyog/constants/routes.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/image_strings.dart';
import 'package:hamarasehyog/utils/text_strings.dart';
import 'package:hamarasehyog/views/on_boarding/on_boarding_model.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final controller = LiquidController();

  // page counter
  int currentPage = 0;

  // shared preferences
  _storeOnBoardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      OnBoardingPage(
          model: OnBoardingModel(
        image: missionIllustration,
        title: "Our Mission",
        subTitle: ourMissionText,
        bgColor: AppColors.onBoardingPage1Color,
      )),
      OnBoardingPage(
          model: OnBoardingModel(
        image: visionIllustration,
        title: "Our Vision",
        subTitle: ourVisionText,
        bgColor: AppColors.onBoardingPage2Color,
      )),
      OnBoardingPage(
          model: OnBoardingModel(
        image: flexIllustration,
        title: "Flexibility",
        subTitle: flexibilityText,
        bgColor: AppColors.onBoardingPage3Color,
      )),
    ];

    return Scaffold(
      backgroundColor: AppColors.onBoardingScreen,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // swipe pages //
          LiquidSwipe(
            pages: pages,
            liquidController: controller,
            onPageChangeCallback: OnPageChangeCallback,
            slideIconWidget: const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
          ),
          // skip button //
          Positioned(
            bottom: 20,
            right: 10,
            child: OutlinedButton(
              onPressed: () async {
                await _storeOnBoardInfo();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(signupRoute, (route) => false);
              },
              child: SmallText(
                text: "Skip",
                color: AppColors.primaryBlack,
                weight: FontWeight.w500,
                size: 18,
              ),
            ),
          ),
          // page indicator effect //
          Positioned(
            bottom: 20,
            child: AnimatedSmoothIndicator(
              activeIndex: controller.currentPage,
              count: 3,
              effect: const WormEffect(
                activeDotColor: Color.fromARGB(255, 235, 119, 83),
                dotHeight: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void OnPageChangeCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }
}
