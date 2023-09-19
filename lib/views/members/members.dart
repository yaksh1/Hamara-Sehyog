// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hamarasehyog/components/big_tex.dart';
import 'package:hamarasehyog/components/text_form.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/dimensions.dart';
import 'package:hamarasehyog/views/main_ui_page/texts/paragraph_text.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Members extends StatefulWidget {
  const Members({super.key});

  @override
  State<Members> createState() => _MembersState();
}

class _MembersState extends State<Members> {
  get height10 => Dimensions.height10;
  
  get width10 => Dimensions.width10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width10 * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: BigText(
                text: "Board Members",
                color: AppColors.mainColor,
                size: width10*4,
              )),
              SizedBox(
                height: height10 * 4,
              ),
              
              ParagraphText(
                width10: width10,
                text: "● Hemant Mahur",
                color: AppColors.primaryBlack,
                size: 16,
              ),
              SizedBox(
                height: height10,
              ),
              ParagraphText(
                width10: width10,
                text: "● Kuldip Dhar",
                color: AppColors.primaryBlack,
                size: 16,
              ),
              SizedBox(
                height: height10,
              ),
              ParagraphText(
                width10: width10,
                text: "● Jharna Jaiswal",
                color: AppColors.primaryBlack,
                size: 16,
              ),
              SizedBox(
                height: height10,
              ),
              ParagraphText(
                width10: width10,
                text: "● Dr. Amrita Srivastav",
                color: AppColors.primaryBlack,
                size: 16,
              ),
              SizedBox(
                height: height10,
              ),
              ParagraphText(
                width10: width10,
                text: "● HSP Rohit Madan",
                color: AppColors.primaryBlack,
                size: 16,
              ),
              SizedBox(
                height: height10,
              ),
              ParagraphText(
                width10: width10,
                text: "● Swati Chatterjee",
                color: AppColors.primaryBlack,
                size: 16,
              ),
              SizedBox(
                height: height10,
              ),
              ParagraphText(
                width10: width10,
                text: "● Meghna Joshi",
                color: AppColors.primaryBlack,
                size: 16,
              ),
              SizedBox(
                height: height10,
              ),
              ParagraphText(
                width10: width10,
                text: "● Lata Mahur",
                color: AppColors.primaryBlack,
                size: 16,
              ),
              SizedBox(
                height: height10,
              ),
              ParagraphText(
                width10: width10,
                text: "● Neeta Surti",
                color: AppColors.primaryBlack,
                size: 16,
              ),
              SizedBox(
                height: height10,
              ),
              ParagraphText(
                width10: width10,
                text: "● Nikhil Jain",
                color: AppColors.primaryBlack,
                size: 16,
              ),
              SizedBox(
                height: height10,
              ),
              ParagraphText(
                width10: width10,
                text: "● Shirali Mewara",
                color: AppColors.primaryBlack,
                size: 16,
              ),
              SizedBox(
                height: height10*3,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
