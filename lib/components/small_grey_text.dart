// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hamarasehyog/utils/colors.dart';

class SmallGreyText extends StatelessWidget {
  final String text;
  const SmallGreyText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.slateGrey,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
