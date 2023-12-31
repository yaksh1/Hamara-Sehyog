// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hamarasehyog/components/big_tex.dart';
import 'package:hamarasehyog/components/small_text.dart';
import 'package:hamarasehyog/components/square_tile.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/image_strings.dart';

class ForgotPasswordPhoneOption extends StatefulWidget {
  const ForgotPasswordPhoneOption({
    super.key,
  });
  static String verify = '';
  @override
  State<ForgotPasswordPhoneOption> createState() =>
      _ForgotPasswordPhoneOptionState();
}

class _ForgotPasswordPhoneOptionState extends State<ForgotPasswordPhoneOption> {
  final TextEditingController _phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  text: "Phone Verification",
                  color: AppColors.primaryBlack,
                  weight: FontWeight.w800,
                  size: 32,
                ),
                SizedBox(
                  height: 10,
                ),
                SmallText(
                  text: "Enter your phone number to reset the password.",
                  size: 16,
                  alignment: TextAlign.center,
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _phoneNumber,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.mobile_friendly_rounded),
                          label: Text("Phone"),
                          labelStyle: TextStyle(color: AppColors.primaryBlack),
                          hintText: "Phone",
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.primaryBlack, width: 2),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () async {
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: "+91${_phoneNumber.text}",
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {},
                              codeSent:
                                  (String verificationId, int? resendToken) {
                                ForgotPasswordPhoneOption.verify = verificationId;
                                Navigator.pushNamed(context, 'pin');
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {},
                            );
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
