import 'package:flutter/material.dart';
import 'package:hamarasehyog/components/big_tex.dart';
import 'package:hamarasehyog/components/small_text.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/dimensions.dart';
import 'package:hamarasehyog/views/main_ui_page/texts/dual_color_text.dart';
import 'package:hamarasehyog/views/main_ui_page/texts/paragraph_text.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  get height10 => Dimensions.height10;
  
  get width10 => Dimensions.width10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(
          text: "Projects Undertaken",
          color: AppColors.mainColor,
          size: width10 * 2.5,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            // BigText(text: "Projects Undertaken", color: AppColors.mainColor,size: width10*3.5,),
            SizedBox(
              height: height10 * 2,
            ),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: height10 * 1.5),
              child: Container(
                  padding: EdgeInsets.all(height10),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.mainColor, width: 2),
                  ),
                  child: Column(
                    children: [
                      DualColorText(
                        text1: "",
                        text2: "3rd August, 2023",
                        color: AppColors.primaryBlack,
                      ),
                      // space
                      SizedBox(
                        height: height10,
                      ),

                      // intro text description
                      SmallText(
                        // width10: width10,
                        text: "Neem Trees plantation",
                        color: AppColors.primaryBlack,
                        weight: FontWeight.w500,
                      ),
                      // space
                      SizedBox(
                        height: height10,
                      ),

                      ParagraphText(
                          width10: width10,
                          text:
                              "50 Neem Trees Plantation mission conducted by us in Baner at common location in new roads near Kalmakar Chok.",
                          color: AppColors.primaryBlack),
                    ],
                  )),
            ),
            SizedBox(
              height: height10 * 2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: height10 * 1.5),
              child: Container(
                  padding: EdgeInsets.all(height10),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.mainColor, width: 2),
                  ),
                  child: Column(
                    children: [
                      DualColorText(
                        text1: "",
                        text2: "30th July, 2023",
                        color: AppColors.primaryBlack,
                      ),
                      // space
                      SizedBox(
                        height: height10,
                      ),

                      // intro text description
                      SmallText(
                        // width10: width10,
                        text: "Tree plantation Drive during monsoon",
                        color: AppColors.primaryBlack,
                        weight: FontWeight.w500,
                      ),
                      // space
                      SizedBox(
                        height: height10,
                      ),

                      ParagraphText(
                          width10: width10,
                          text:
                              "Tree Plantation mission conducted by us in monsoon in order to increase vegetation in surrounding areas.",
                          color: AppColors.primaryBlack),
                      
                    ],
                  )),
            ),
            SizedBox(
              height: height10 * 2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: height10 * 1.5),
              child: Container(
                  padding: EdgeInsets.all(height10),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.mainColor, width: 2),
                  ),
                  child: Column(
                    children: [
                      DualColorText(
                        text1: "",
                        text2: "5th Feb, 2023",
                        color: AppColors.primaryBlack,
                      ),
                      // space
                      SizedBox(
                        height: height10,
                      ),

                      // intro text description
                      SmallText(
                          // width10: width10,
                          text: "Food Distribution",
                          color: AppColors.primaryBlack,
                          weight: FontWeight.w500,
                          ),
                                            // space
                      SizedBox(
                        height: height10,
                      ),

                      ParagraphText(
                          width10: width10,
                          text:
                              "Snacks were distributed to 100 persons in the Area.",
                          color: AppColors.primaryBlack),
                      ParagraphText(
                          width10: width10,
                          text: "HS Participants: Hemant Mahur, Lata Mahur",
                          color: AppColors.primaryBlack),
                    ],
                  )),
            ),
            SizedBox(
              height: height10 * 2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: height10 * 1.5),
              child: Container(
                  padding: EdgeInsets.all(height10),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.mainColor, width: 2),
                  ),
                  child: Column(
                    children: [
                      DualColorText(
                        text1: "",
                        text2: "15th Aug, 2022",
                        color: AppColors.primaryBlack,
                      ),
                      // space
                      SizedBox(
                        height: height10,
                      ),
                      SmallText(
                        // width10: width10,
                        text: "15th August Celebrations",
                        color: AppColors.primaryBlack,
                        weight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: height10,
                      ),
                      // intro text description
                      ParagraphText(
                          width10: width10,
                          text: "Online Independence Day celebration with basti students. 25 kids participated in online celebrations of Independence Day from different bastis of Baner. Kids showcase their talent by preforming dance, singing songs, reciting poems, making drawings and delivered speech relevant to independence day.. With Hamara Sehyog pune members and kids online program was a great success🙏🏻",
                          color: AppColors.primaryBlack),
                      SizedBox(
                        height: height10,
                      ),
                      ParagraphText(
                          width10: width10,
                          text: "HS Participants: Jharna Mahur Jaiswal, Dipali, Surekhaji, Lata Mahur",
                          color: AppColors.primaryBlack),    
                    ],
                  )),
            ),
            SizedBox(
              height: height10*2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: height10 * 1.5),
              child: Container(
                  padding: EdgeInsets.all(height10),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.mainColor, width: 2),
                  ),
                  child: Column(
                    children: [
                      DualColorText(
                        text1: "",
                        text2: "2nd Apr, 2021",
                        color: AppColors.primaryBlack,
                      ),
                      // space
                      SizedBox(
                        height: height10,
                      ),

                      // intro text description
                      SmallText(
                        // width10: width10,
                        text: "Food Packet Distribution",
                        color: AppColors.primaryBlack,
                        weight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: height10,
                      ),
                      ParagraphText(
                          width10: width10,
                          text:
                              "100 food packets were distributed to mainly children & ladies at Balewadi Jhopad pati. Amidst the afternoon heat and elevated corona conditions in Pune, which brings panic and scarcity to unprivileged class, Mr. Hemant Mahur and Mrs. Lata Mahur (taking full precautions possible) generously distributed 100 food packets to 2 different Bastis of Baner. Hamara Sahyog contribution to the society is still going on and each member should feel proud that we are all helping and shaping a better India with our own contribution. Thanks to Mr & Mrs Mahur to take out time and do this distribution on our behalf.",
                          color: AppColors.primaryBlack),
                      SizedBox(
                        height: height10,
                      ),
                      ParagraphText(
                          width10: width10,
                          text:
                              "HS Participants: Mr. Hemant Mahur and Mrs. Lata Mahur",
                          color: AppColors.primaryBlack), 
                    ],
                  )),
            ),
            SizedBox(
              height: height10*2,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: height10 * 1.5),
              child: Container(
                  padding: EdgeInsets.all(height10),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.mainColor, width: 2),
                  ),
                  child: Column(
                    children: [
                      DualColorText(
                        text1: "",
                        text2: "3rd Feb, 2021",
                        color: AppColors.primaryBlack,
                      ),
                      // space
                      SizedBox(
                        height: height10,
                      ),
                      SmallText(
                        // width10: width10,
                        text: "Distribution of meals",
                        color: AppColors.primaryBlack,
                        weight: FontWeight.w500,
                      ),
                      // intro text description
                      ParagraphText(
                          width10: width10,
                          text:
                              "116 Meals were distributed in Matoshree nagar (kachi jhopad pati कच्ची झोपड़ पट्टी) Balewadi at 12 PM (noon)",
                          color: AppColors.primaryBlack),
                      SizedBox(
                        height: height10,
                      ),
                      ParagraphText(
                          width10: width10,
                          text:
                              "HS Participants: Mr. Mahur, Mr. Dhar",
                          color: AppColors.primaryBlack),
                    ],
                  )),
            ),
            SizedBox(
              height: height10,
            ),
          ],
        ),
      ),
    );
  }
}