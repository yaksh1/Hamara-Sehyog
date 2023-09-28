// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hamarasehyog/components/big_tex.dart';
import 'package:hamarasehyog/components/small_text.dart';
import 'package:hamarasehyog/components/square_tile.dart';
import 'package:hamarasehyog/services/auth/auth_service.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/image_strings.dart';

import 'package:pinput/pinput.dart';

class ForgotPasswordOtp extends StatelessWidget {
  final String id;
  ForgotPasswordOtp({super.key, required this.id});
  TextEditingController otpcontroller = TextEditingController();
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
                SizedBox(
                  height: 10,
                ),
                SmallText(
                  text: "Enter the OTP code sent at yakshgandhi1@gmail.com ",
                  size: 18,
                  alignment: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Pinput(
                  controller: otpcontroller,
                  length: 6,
                  onCompleted: (value) async {
                    log(value);
                    await AuthService.firebase().verifyCode(id, value);

                    final user = AuthService.firebase().currentUser;
                    if (user!=null) {
                      log("done");
                    }
                  },
                ),
                // OTPTextField(
                //   length: 6,
                //   width: MediaQuery.of(context).size.width,
                //   fieldWidth: 80,
                //   style: TextStyle(fontSize: 17),
                //   textFieldAlignment: MainAxisAlignment.spaceAround,
                //   fieldStyle: FieldStyle.underline,
                //   onCompleted: (pin) {
                //     log("Completed: " + pin);
                //   },
                // ),
                // OtpTextField(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   numberOfFields: 6,
                //   filled: true,
                //   fillColor: Colors.black.withOpacity(0.1),
                //   cursorColor: AppColors.primaryBlack,
                //   focusedBorderColor: AppColors.mainColor,
                //   onSubmit: (String otp) {
                //     log(otp);
                //     AuthService.firebase().verifyCode(id, otp);
                //   },
                // ),
                SizedBox(
                  height: 30,
                ),
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
