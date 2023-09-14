import 'package:flutter/material.dart';
import 'package:hamarasehyog/components/big_tex.dart';
import 'package:hamarasehyog/components/small_text.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/views/on_boarding/on_boarding_model.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    required this.model,
    super.key,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: model.bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage(model.image),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 150, left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      BigText(
                        text: model.title,
                        color: AppColors.primaryBlack,
                        size: 40,
                        weight: FontWeight.w800,
                      ),
                    ],
                  ),
                  SmallText(text: model.subTitle),
                ],
              ),
            ),
            const Spacer(),
            
          ],
        ));
  }
}
