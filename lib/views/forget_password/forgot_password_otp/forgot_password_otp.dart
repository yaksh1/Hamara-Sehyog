// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamarasehyog/components/big_tex.dart';
import 'package:hamarasehyog/components/small_text.dart';
import 'package:hamarasehyog/components/square_tile.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/image_strings.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class ForgotPasswordOtp extends StatelessWidget {
  const ForgotPasswordOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 35.0),
                  child: SquareTile(
                    imagePath: forgotPasswordImage,
                    height: 150,
                  ),
                ),
                BigText(
                  text: "OTP Verification",
                  color: AppColors.primaryBlack,
                  weight: FontWeight.w800,
                  size: 34,
                ),
                SizedBox(height: 10,),
                SmallText(
                  text: "Enter the OTP code sent at yakshgandhi1@gmail.com ",
                  size: 18,
                  alignment: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                OtpTextField(
                  mainAxisAlignment: MainAxisAlignment.center,
                  numberOfFields:6,
                  filled:true,
                  fillColor: Colors.black.withOpacity(0.1),
                  cursorColor: AppColors.primaryBlack,
                  focusedBorderColor: AppColors.mainColor,
                ),
                SizedBox(height: 30,),
                SizedBox(
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {},
                    textColor: AppColors.grey,
                    color: AppColors.primaryBlack,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    height: 60,
                    child: const Text(
                      "Next",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
