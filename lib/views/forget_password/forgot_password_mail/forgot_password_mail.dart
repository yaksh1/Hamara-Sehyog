// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hamarasehyog/components/big_tex.dart';
import 'package:hamarasehyog/components/email_text_field.dart';
import 'package:hamarasehyog/components/small_text.dart';
import 'package:hamarasehyog/components/square_tile.dart';
import 'package:hamarasehyog/services/auth/auth_service.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/image_strings.dart';

class ForgotPasswordMailOption extends StatefulWidget {
  const ForgotPasswordMailOption({super.key});

  @override
  State<ForgotPasswordMailOption> createState() => _ForgotPasswordMailOptionState();
}

class _ForgotPasswordMailOptionState extends State<ForgotPasswordMailOption> {
   TextEditingController _email = TextEditingController();

  @override
  void initState() {
    _email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 35.0),
                  child: SquareTile(
                    imagePath: forgotPasswordImage,
                    height: 150,
                  ),
                ),
                BigText(
                  text: "E-mail Verification",
                  color: AppColors.primaryBlack,
                  weight: FontWeight.w800,
                  size: 32,
                ),
                SizedBox(height: 10,),
                SmallText(
                  text: "Enter your email to reset the password.",
                  size: 16,
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  child: Column(
                    children: [
                      EmailTextField(controller: _email),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () {
                            AuthService.firebase()
                                .passwordReset(email: _email.text.trim());
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
