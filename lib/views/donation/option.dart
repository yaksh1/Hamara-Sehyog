import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hamarasehyog/components/big_tex.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/dimensions.dart';
import 'package:hamarasehyog/utils/text_strings.dart';
import 'package:hamarasehyog/views/main_ui_page/categories/categories.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class Options extends StatelessWidget {
   Options({super.key});
  double width10 = Dimensions.width10;
  double height10 = Dimensions.height10;
  double radius10 = Dimensions.radius10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(text:"Ways of Donating",color: AppColors.mainColor,size: 25,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top:height10*2.0,bottom: height10*2),
          child: Wrap(
          runSpacing: height10 * 3,
          children: [
            
            DonationCategory(
              height10: height10,
              width10: width10,
              radius10: radius10,
              icon: PhosphorIcons.duotone.pencil,
              donateCategory: ghyanDhyan,
              details: ghyanDhyanDetails,
            ),
            DonationCategory(
              height10: height10,
              width10: width10,
              radius10: radius10,
              icon: PhosphorIcons.fill.bowlFood,
              donateCategory: hunger,
              details: hungerDetails,
            ),
            DonationCategory(
              height10: height10,
              width10: width10,
              radius10: radius10,
              icon: PhosphorIcons.duotone.heart,
              donateCategory: healthcare,
              details: healthCareDetails,
            ),
            DonationCategory(
              height10: height10,
              width10: width10,
              radius10: radius10,
              icon: PhosphorIcons.duotone.tree,
              donateCategory: treePlantation,
              details: treePlatationDetails,
            ),
            DonationCategory(
              height10: height10,
              width10: width10,
              radius10: radius10,
              icon: PhosphorIcons.duotone.money,
              donateCategory: "Financial Aid",
              details: moneyDetails,
            ),
          ],
            ),
        ),
      )
    );
  }
}