import 'package:flutter/material.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/dimensions.dart';
import 'package:hamarasehyog/views/main_ui_page/texts/dual_color_text.dart';
import 'package:hamarasehyog/views/main_ui_page/texts/paragraph_text.dart';

class Items extends StatelessWidget {
  Items({super.key});
  final double height10 = Dimensions.height10;
  final double width10 = Dimensions.width10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: height10 * 1.5),
              child: Container(
                  padding: EdgeInsets.all(height10),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.mainColor, width: 2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DualColorText(
                        text1: "Our ",
                        text2: "Address",
                        color: AppColors.primaryBlack,
                      ),
                      // space
                      SizedBox(
                        height: height10,
                      ),

                      // intro text description
                      ParagraphText(
                        width10: width10,
                        text: "FLAT NO A /6/1 GERA EMERALD CITY BUILDING NO 1",
                        color: AppColors.primaryBlack,
                      ),
                      SizedBox(
                        height: height10,
                      ),
                      ParagraphText(
                        width10: width10,
                        text: "6 th FLOOR SERVEY NO 66",
                        color: AppColors.primaryBlack,
                      ),
                      SizedBox(
                        height: height10,
                      ),
                      ParagraphText(
                        width10: width10,
                        text: "PAN CARD CLUB ROAD ",
                        color: AppColors.primaryBlack,
                      ),
                      SizedBox(
                        height: height10,
                      ),
                      ParagraphText(
                        width10: width10,
                        text: "BANER, PUNE",
                        color: AppColors.primaryBlack,
                      ),
                      SizedBox(
                        height: height10,
                      ),
                      ParagraphText(
                        width10: width10,
                        text: "411045",
                        color: AppColors.primaryBlack,
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}