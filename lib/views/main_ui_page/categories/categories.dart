// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamarasehyog/components/big_tex.dart';
import 'package:hamarasehyog/components/small_text.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/views/donation/donation.dart';
import 'package:hamarasehyog/views/main_ui_page/texts/paragraph_text.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DonationCategory extends StatelessWidget {
  const DonationCategory({
    super.key,
    required this.height10,
    required this.width10,
    required this.radius10,
    required this.icon,
    required this.donateCategory,
    required this.details,
  });

  final double height10;
  final double width10;
  final double radius10;
  final IconData icon;
  final String donateCategory;
  final String details;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height10 * 37,
      margin: EdgeInsets.only(right: width10 * 2.5, left: width10 * 2.5),
      // color: AppColors.mainColor,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius10 * 3),
        color: AppColors.grey,
        border: Border.all(width: width10 * 0.6, color: AppColors.darkOrange),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // title
          Padding(
            padding: EdgeInsets.only(top: height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: AppColors.secondaryBlack,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                BigText(
                  text: donateCategory,
                  color: AppColors.secondaryBlack,
                  size: width10*1.9,
                )
              ],
            ),
          ),
          // space
          // SizedBox(height: height10 * 1.2),
          // paragraph
          ParagraphText(
            align: TextAlign.center,
            width10: width10,
            text: details,
            color: AppColors.secondaryBlack,
            size: width10*1.4,

          ),
          // space
          // button
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0),
            child: OutlinedButton(
              onPressed: () {
                Get.to(() => Donation());
              },
              style: OutlinedButton.styleFrom(
                  elevation: 5,
                  shadowColor: AppColors.secondaryBlack,
                  side: BorderSide(
                    color: AppColors.primaryBlack,
                    width: 3,
                  ),
                  backgroundColor: AppColors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: SmallText(text: "Donate", color: AppColors.secondaryBlack),
            ),
          ),
        ],
      ),
    );
  }
}
