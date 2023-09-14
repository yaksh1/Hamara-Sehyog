import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamarasehyog/utils/colors.dart';

class DualColorText extends StatelessWidget {
  const DualColorText({
    super.key,
    required this.text1,
    required this.text2,
    this.size = 30, this.align =TextAlign.center ,
  });

  final String text1;
  final String text2;
  final double size;
  final TextAlign align;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: align,
      text: TextSpan(
        text: text1,
        style: GoogleFonts.openSans(
          textStyle: TextStyle(
            fontSize: size,
            color: AppColors.grey,
            fontWeight: FontWeight.w700,
          ),
        ),
        children: <TextSpan>[
          TextSpan(
            text: text2,
            style: GoogleFonts.openSans(
              textStyle: TextStyle(
                fontSize: size,
                color: AppColors.mainColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
