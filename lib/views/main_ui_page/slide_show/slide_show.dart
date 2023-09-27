// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'dart:developer';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hamarasehyog/helper/event.dart';
import 'package:hamarasehyog/helper/image.dart';
import 'package:hamarasehyog/models/slide_show_event.dart';
import 'package:hamarasehyog/models/slide_show_image.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/dimensions.dart';
import 'package:logger/logger.dart';

class SlideShow extends StatefulWidget {
  const SlideShow({super.key});

  @override
  State<SlideShow> createState() => _SlideShowState();
}

class _SlideShowState extends State<SlideShow> {
  // page controller
  PageController pageController = PageController(viewportFraction: .85);
  // page value
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _heightContainer1 = Dimensions.slideShowContainer;
  double _heightContainer2 = Dimensions.slideShowTextContainer;
  double width10 = Dimensions.width10;
  double height10 = Dimensions.height10;
  double radius10 = Dimensions.radius10;

  // get image paths list
  List<SlideShowImageModel> imagePaths = List<SlideShowImageModel>.empty();

  @override
  void initState() {
    super.initState();
    imagePaths = getImages();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  // print()
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: AppColors.grey,
          height: Dimensions.slideShowWholeContainer,
          // width: 350,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position, imagePaths[position].imagePath,
                  imagePaths[position].eventName,
                  imagePaths[position].eventDate);
            },
          ),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue.floor(),
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius10 / 2)),
            activeColor: AppColors.darkOrange,
          ),
        ),
      ],
    );
  }

  Widget _buildPageItem(
      int position, String imagePath, String eventTitle, String date) {
    // logic for scaling while scrolling through slide show
    Matrix4 matrix = Matrix4.identity();
    if (position == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - position) * (1 - _scaleFactor);
      var currTrans = _heightContainer1 * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (position == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - position + 1) * (1 - _scaleFactor);
      var currTrans = _heightContainer1 * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (position == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - position) * (1 - _scaleFactor);
      var currTrans = _heightContainer1 * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _heightContainer1 * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(children: [
        // image container
        Container(
          height: _heightContainer1,
          margin: EdgeInsets.only(left: width10, right: width10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius10 * 3),
            color: AppColors.onBoardingPage1Color,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                imagePath,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: _heightContainer2,
            width: double.infinity,
            margin: EdgeInsets.only(
                left: width10 * 3, right: width10 * 3, bottom: height10 * 1.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius10 * 2),
              color: AppColors.mainColor,
              boxShadow: const [
                BoxShadow(
                  color: AppColors.slateGrey,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
                BoxShadow(
                  color: AppColors.mainColor,
                  // blurRadius: 10.0,
                  offset: Offset(-5, 0),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  eventTitle,
                  style:TextStyle(fontWeight: FontWeight.w500,
                  fontSize: width10*2,
                  color: Colors.white,
                  )
                  ),
                Text(date,
                style: TextStyle(
                  fontSize: width10*1.5,
                  color: Colors.white,
                ),),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
