// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamarasehyog/components/big_tex.dart';
import 'package:hamarasehyog/components/small_text.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/text_strings.dart';
import 'package:hamarasehyog/views/forget_password/forgot_password_btn_widget.dart';
import 'package:hamarasehyog/views/forget_password/forgot_password_mail/forgot_password_mail.dart';
import 'package:hamarasehyog/views/forget_password/forgot_password_phone/forgot_password-phone.dart';

class ForgotPasswordScreen {
  static Future<dynamic> ForgotPasswordBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigText(
              text: forgotPasswordTitle,
              color: AppColors.primaryBlack,
              size: 25,
            ),
            SmallText(
              text: forgotPasswordSubtitle,
              color: AppColors.primaryBlack,
              size: 16,
            ),
            const SizedBox(
              height: 30,
            ),
            ForgotPasswordBtnWidget(
              btnIcon: Icons.mail_outline_outlined,
              title: "E-mail",
              subtitle: "Reset via mail verification",
              onTap: () {
                Navigator.pop(context);
                Get.to(() => ForgotPasswordMailOption());
              },
            ),
            SizedBox(
              height: 20,
            ),
            ForgotPasswordBtnWidget(
              btnIcon: Icons.mobile_friendly_outlined,
              title: "Phone",
              subtitle: "Reset via phone verification",
              onTap: () {
                Navigator.pop(context);
                Get.to(() => ForgotPasswordPhoneOption());
              },
            ),
          ],
        ),
      ),
    );
  }
}

