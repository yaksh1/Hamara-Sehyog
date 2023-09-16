import 'package:flutter/material.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/dimensions.dart';

class ImagesForGallery extends StatelessWidget {
  ImagesForGallery({
    super.key,
    required this.image,
  });

  final double height10 = Dimensions.height10;
  final double width10 = Dimensions.width10;
  final double radius10 = Dimensions.radius10;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height10),
      child: Container(
        height: height10 * 37,
        margin: EdgeInsets.only(right: width10 * 2.5, left: width10 * 2.5),
        // color: AppColors.mainColor,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius10 * 3),
          color: AppColors.grey,
          border: Border.all(width: width10 * 0.6, color: AppColors.darkOrange),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(image),
          ),
        ),
      ),
    );
  }
}
