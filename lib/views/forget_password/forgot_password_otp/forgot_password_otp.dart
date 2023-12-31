// ignore_for_file: prefer_const_constructors


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamarasehyog/components/big_tex.dart';
import 'package:hamarasehyog/components/my_snackbar.dart';
import 'package:hamarasehyog/components/small_text.dart';
import 'package:hamarasehyog/components/square_tile.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/image_strings.dart';
import 'package:hamarasehyog/views/forget_password/forgot_password_phone/forgot_password-phone.dart';
import 'package:hamarasehyog/views/forget_password/reset%20password/reset_password_page.dart';
import 'package:logger/logger.dart';

import 'package:pinput/pinput.dart';

class ForgotPasswordOtp extends StatelessWidget {
  ForgotPasswordOtp({super.key});
  TextEditingController otpcontroller = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var code = '';
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
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
                  length: 6,
                  showCursor: true,
                  onChanged: (value) {
                    code = value;
                  },
                  onCompleted: (pin) => Logger().d(pin),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () async {
                      try {
                        // Create a PhoneAuthCredential with the code
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId:
                                    ForgotPasswordPhoneOption.verify,
                                smsCode: code);

                        // Sign the user in (or link) with the credential
                        await auth.signInWithCredential(credential);
                        Get.to(() => ResetPasswordView());
                      } catch (e) {
                        MySnackBar().mySnackBar(
                          header: "Error",
                          content: "Wrong OTP",
                          bgColor: Colors.red.shade200,
                          borderColor: Colors.red,
                        );
                      }
                    },
                    textColor: AppColors.grey,
                    color: AppColors.primaryBlack,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    height: 60,
                    child: const Text(
                      "Next",
                      style: TextStyle(
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
