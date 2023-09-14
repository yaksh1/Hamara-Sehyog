// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hamarasehyog/components/big_tex.dart';
import 'package:hamarasehyog/components/small_text.dart';
import 'package:hamarasehyog/utils/colors.dart';

class ForgotPasswordBtnWidget extends StatelessWidget {
  const ForgotPasswordBtnWidget({
    required this.title,
    required this.btnIcon,
    required this.subtitle,
    required this.onTap,
    super.key,
  });

  final String title, subtitle;
  final IconData btnIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[300],
        ),
        child: Row(
          children: [
            Icon(
              btnIcon,
              size: 50,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(
                  text: title,
                  color: AppColors.primaryBlack,
                  size: 25,
                ),
                SmallText(
                  text: subtitle,
                  size: 14,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
