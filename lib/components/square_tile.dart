// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  final double? height;
  const SquareTile({super.key, required this.imagePath, this.height = 60});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(15),
      height: height,
      child: Image.asset(imagePath),
    );
  }
}
