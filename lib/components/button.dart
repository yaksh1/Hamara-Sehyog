import 'package:flutter/material.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/dimensions.dart';


class OrangeButton extends StatelessWidget {
  OrangeButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.width = double.infinity,
    this.borderRadius = 8,
  });

  final double radius10 = Dimensions.radius10;
  final double height10 = Dimensions.height10;
  final double width10 = Dimensions.width10;
  final VoidCallback onPressed;
  final String text;
  final double width;
  final double borderRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: MaterialButton(
        onPressed: onPressed,
        textColor: AppColors.grey,
        color: AppColors.mainColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
        height: height10 * 6,
        child: Text(
          text,
          style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: width10 * 1.8),
        ),
      ),
    );
  }
}
