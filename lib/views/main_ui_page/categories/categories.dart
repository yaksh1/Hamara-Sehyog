import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamarasehyog/components/big_tex.dart';
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
        color: AppColors.primaryBlack,
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
                  color: AppColors.grey,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                BigText(
                  text: donateCategory,
                  color: AppColors.grey,
                  size: 22,
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
          ),
          // space
          // button
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0),
            child: MaterialButton(
              onPressed: () {
                Get.to(()=>Donation());
              },
              height: height10 * 4,
              minWidth: width10 * 15,
              textColor: AppColors.primaryBlack,
              color: AppColors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius10 * 0.8),
              ),
              child: Text(
                "Donate ->",
                style: TextStyle(color: AppColors.primaryBlack, fontSize: 22),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
