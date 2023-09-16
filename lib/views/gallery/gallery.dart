import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamarasehyog/components/big_tex.dart';
import 'package:hamarasehyog/components/small_text.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/dimensions.dart';
import 'package:hamarasehyog/views/gallery/food_distribution.dart';
import 'package:hamarasehyog/views/gallery/tree_plantation.dart';
import 'package:hamarasehyog/views/gallery/tree_plantation_2.dart';
import 'package:hamarasehyog/views/join%20us/join_us.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  double get width10 => Dimensions.width10;

  get height10 => Dimensions.height10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(
          text: "Gallery",
          color: AppColors.mainColor,
          size: 30,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: height10 * 4,
            ),
            GalleryImages(
              height10: height10,
              width10: width10,
              text: "Tree plantation 3rd August 2023",
              onPressed: () {
                Get.to(() => TreePlantation2());
              },
            ),
            GalleryImages(
              height10: height10,
              width10: width10,
              text: "Tree plantation Drive during monsoon 30th July 2023",
              onPressed: () {
                Get.to(() => TreePlantation());
              },
            ),
            GalleryImages(
              height10: height10,
              width10: width10,
              text: "Food Distribution 5th Feb 2023",
              onPressed: () {
                Get.to(() => FoodDistribution1());
              },
            ),
            GalleryImages(
              height10: height10,
              width10: width10,
              text: "15th August 2022 Celebrations",
              onPressed: () {
                Get.to(() => JoinUs());
              },
            ),
            GalleryImages(
              height10: height10,
              width10: width10,
              text: "Food Packet Distribution 2nd April 2021",
              onPressed: () {
                Get.to(() => JoinUs());
              },
            ),
            GalleryImages(
                height10: height10,
                width10: width10,
                text: "Distribution of meals 3rd Feb 2021",
                onPressed: () {
                  Get.to(() => JoinUs());
                }),
          ],
        ),
      ),
    );
  }
}

class GalleryImages extends StatelessWidget {
  const GalleryImages({
    super.key,
    required this.height10,
    required this.width10,
    required this.text,
    required this.onPressed,
  });

  final double height10;
  final double width10;
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: EdgeInsets.only(bottom: height10 * 2),
        child: Center(
          child: Container(
            height: height10 * 5,
            margin: EdgeInsets.symmetric(horizontal: width10 * 2.5),
            child: OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                  minimumSize: Size(double.infinity, height10 * 3),
                  elevation: 5,
                  shadowColor: AppColors.primaryBlack,
                  side: BorderSide(
                    color: AppColors.primaryBlack,
                    width: 3,
                  ),
                  backgroundColor: AppColors.onBoardingPage3Color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SmallText(
                  alignment: TextAlign.start,
                  text: text,
                  color: AppColors.secondaryBlack,
                  size: 15,
                ),
              ),
            ),
          ),
        ),
    );
  }
}
