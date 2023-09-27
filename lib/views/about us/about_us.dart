// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hamarasehyog/components/big_tex.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/dimensions.dart';
import 'package:hamarasehyog/utils/text_strings.dart';
import 'package:hamarasehyog/views/main_ui_page/texts/dual_color_text.dart';
import 'package:hamarasehyog/views/main_ui_page/texts/paragraph_text.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  get height10 => Dimensions.height10;
  
  get width10 => Dimensions.width10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title:  BigText(text: "About Us", color: AppColors.mainColor,size: width10*3,),
      centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: height10*2,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:height10*1.5),
              child: Container(
                padding: EdgeInsets.all(height10),
                decoration: BoxDecoration(
                  
                  border: Border.all(color: AppColors.mainColor,width: 2),
                ),
                child:Column(
                  children: [
              DualColorText(
                text1: wel1,
                text2: wel2,
                color: AppColors.primaryBlack,
              ),
              // space
              SizedBox(
                height: height10,
              ),
            
              // intro text description
              ParagraphText(
                width10: width10,
                text: introText,
                color: AppColors.primaryBlack
              ),
                  ],
                )
              ),
            ),
            SizedBox(
              height: height10 * 2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: height10 * 1.5),
              child: Container(
                  padding: EdgeInsets.all(height10),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.mainColor, width: 2),
                  ),
                  child: Column(
                    children: [
                      DualColorText(
                        text1: "Our ",
                        text2: "Vision",
                        color: AppColors.primaryBlack,
                      ),
                      // space
                      SizedBox(
                        height: height10,
                      ),

                      // intro text description
                      ParagraphText(
                          width10: width10,
                          text: ourVisionText,
                          color: AppColors.primaryBlack),
                    ],
                  )),
            ),
            SizedBox(
              height: height10 * 2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: height10 * 1.5),
              child: Container(
                  padding: EdgeInsets.all(height10),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.mainColor, width: 2),
                  ),
                  child: Column(
                    children: [
                      DualColorText(
                        text1: "Our ",
                        text2: "Mission",
                        color: AppColors.primaryBlack,
                      ),
                      // space
                      SizedBox(
                        height: height10,
                      ),

                      // intro text description
                      ParagraphText(
                          width10: width10,
                          text: ourMissionText1,
                          color: AppColors.primaryBlack),
                    ],
                  )),
            ),
            SizedBox(
              height: height10 * 2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: height10 * 1.5),
              child: Container(
                  padding: EdgeInsets.all(height10),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.mainColor, width: 2),
                  ),
                  child: Column(
                    children: [
                      DualColorText(
                        text1: "Our ",
                        text2: "Goals",
                        color: AppColors.primaryBlack,
                      ),
                      // space
                      SizedBox(
                        height: height10,
                      ),

                      // intro text description
                      ParagraphText(
                          width10: width10,
                          text: ourGoalsText,
                          color: AppColors.primaryBlack),
                      
                    ],
                  )),
            ),
            SizedBox(
              height: height10 * 2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: height10 * 1.5),
              child: Container(
                  padding: EdgeInsets.all(height10),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.mainColor, width: 2),
                  ),
                  child: Column(
                    children: [
                      DualColorText(
                        text1: "Our ",
                        text2: "Objectives",
                        color: AppColors.primaryBlack,
                      ),
                      // space
                      SizedBox(
                        height: height10,
                      ),

                      // intro text description
                      ParagraphText(
                        width10: width10,
                        text: objectives1,
                        color: AppColors.primaryBlack,
                      ),
                      SizedBox(
                        height: height10,
                      ),
                        ParagraphText(
                        width10: width10,
                        text: objectives2,
                        color: AppColors.primaryBlack,
                      ),
                      SizedBox(
                        height: height10,
                      ),
                      ParagraphText(
                          width10: width10,
                          text: objectives3,
                          color: AppColors.primaryBlack,
                        ),
                      SizedBox(
                        height: height10,
                      ),
                      ParagraphText(
                          width10: width10,
                          text: objectives4,
                          color: AppColors.primaryBlack,
                        ),
                    ],
                  )),
            ),          
             SizedBox(
              height: height10,
            ),         

          ],
        ),
      ),
    );
  }
}