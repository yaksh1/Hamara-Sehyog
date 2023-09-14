import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamarasehyog/components/responsive_text.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/text_strings.dart';

class ParagraphText extends StatelessWidget {
  const ParagraphText({
    super.key,
    required this.width10,
    required this.text,
    this.align = TextAlign.justify,
    this.size=13,
  });

  final double width10;
  final String text;
  final TextAlign align;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width10),
      child: ResponsiveText(
        textAlign: align,
        text: text,
        style: GoogleFonts.openSans(
          textStyle: TextStyle(
            color: AppColors.grey,
            fontSize: size,
          ),
        ),
      ),
    );
  }
}
