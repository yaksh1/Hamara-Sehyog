import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  const BigText(
      {super.key, required this.text, required this.color, this.size =40, this.weight = FontWeight.w700});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(
        textStyle: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: weight,
        ),
      ),
    );
  }
}
