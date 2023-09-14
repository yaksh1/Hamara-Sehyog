// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamarasehyog/components/big_tex.dart';
import 'package:hamarasehyog/components/responsive_text.dart';
import 'package:hamarasehyog/components/small_text.dart';
import 'package:hamarasehyog/enums/drawer_sections.dart';
import 'package:hamarasehyog/enums/meun_actions.dart';
import 'package:hamarasehyog/services/auth/auth_service.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/dimensions.dart';
import 'package:hamarasehyog/utils/image_strings.dart';
import 'package:hamarasehyog/utils/text_strings.dart';
import 'package:hamarasehyog/views/donation/donation.dart';
import 'package:hamarasehyog/views/join%20us/join_us.dart';
import 'package:hamarasehyog/views/log_in.dart';
import 'package:hamarasehyog/views/main_ui_page/categories/categories.dart';
import 'package:hamarasehyog/views/main_ui_page/texts/paragraph_text.dart';
import 'package:hamarasehyog/views/main_ui_page/navbar/nav_bar.dart';
import 'package:hamarasehyog/views/main_ui_page/slide_show/slide_show.dart';
import 'package:hamarasehyog/views/main_ui_page/texts/dual_color_text.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MainUI extends StatefulWidget {
  const MainUI({super.key});

  @override
  State<MainUI> createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> {
  double width10 = Dimensions.width10;
  double height10 = Dimensions.height10;
  double radius10 = Dimensions.radius10;
  var currentPage = DrawerSections.home;
  @override
  Widget build(BuildContext context) {
    // print("current width is " + MediaQuery.of(context).size.width.toString());
    return Scaffold(
      // side menu
      // drawer: Drawer(
      //   child: SingleChildScrollView(
      //     physics: BouncingScrollPhysics(),
      //     child: Container(
      //       child: Column(
      //         children: [
      //           // MyHeaderDrawer(),
      //           SizedBox(
      //             height: 50,
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      // background color of page
      backgroundColor: AppColors.secondaryBlack,
      // header
      appBar: AppBar(
        title: Image.asset(appLogo2),
        // centerTitle: true,
        // automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryBlack,
        iconTheme: IconThemeData(color: AppColors.grey, size: 35),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: OutlinedButton(
              onPressed: () {
                Get.to(() => Donation());
              },
              style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: AppColors.mainColor,
                    width: 3,
                  ),
                  backgroundColor: AppColors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: SmallText(text: "Donate", color: AppColors.mainColor),
            ),
          ),
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  final shouldLogout = await showLogOutDiaglog(context);
                  if (shouldLogout) {
                    await AuthService.firebase().logOut();
                    // ignore: use_build_context_synchronously
                    Get.to(()=> LogInView());
                  }
              }
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                    value: MenuAction.logout, child: Text("Logout")),
                // const PopupMenuItem(
                //     value: MenuAction.favorites, child: Text("Favorites")),
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: height10,
            ),
            // title of page slogan //
            BigText(
                text: "Together We Can Make", color: AppColors.grey, size: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BigText(text: "the Society", color: AppColors.grey, size: 30),
                SizedBox(width: 7),
                BigText(
                    text: "Worth Living", color: AppColors.mainColor, size: 30),
              ],
            ),
            // space
            SizedBox(
              height: height10 * 2,
            ),
            // slide show of events
            SlideShow(),
            // space
            SizedBox(
              height: height10,
            ),
            // welcome
            DualColorText(
              text1: wel1,
              text2: wel2,
            ),
            // space
            SizedBox(
              height: height10,
            ),

            // intro text description
            ParagraphText(
              width10: width10,
              text: introText,
            ),

            // space
            SizedBox(
              height: height10 * 4,
            ),

            // donation categories
            Wrap(
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
                  donateCategory: money,
                  details: moneyDetails,
                ),
              ],
            ),

            // space
            SizedBox(
              height: height10 * 4,
            ),
            // join our team container
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Wrap(
                runSpacing: 20,
                children: [
                  // dual color title
                  DualColorText(
                    text1: joinOur,
                    text2: team,
                  ),
                  // paragraph
                  ParagraphText(
                    width10: width10,
                    text: joinOurTeamDetails,
                    size: 16,
                  ),
                  // dual color title
                  DualColorText(
                    text1: "Donate Your ",
                    text2: timeAndSkills,
                    size: 25,
                  ),
                  // paragraph
                  ParagraphText(
                      width10: width10, text: timeAndSkillsDetails, size: 16),
                  // dual color title
                  DualColorText(
                      text1: "Donate Your ", text2: sponsorship, size: 25),
                  // paragraph
                  ParagraphText(
                      width10: width10, text: sponsorshipDetails, size: 16),
                  // join us button
                  Padding(
                    padding: EdgeInsets.only(bottom: height10 * 2),
                    child: Center(
                      child: MaterialButton(
                        onPressed: () {
                          Get.to(() => JoinUs());
                        },
                        height: height10 * 3.5,
                        minWidth: width10 * 12,
                        textColor: AppColors.primaryBlack,
                        color: AppColors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(radius10 * 0.8),
                        ),
                        child: Text(
                          "Join Us ->",
                          style: TextStyle(
                              color: AppColors.primaryBlack, fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 20,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<bool> showLogOutDiaglog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Sign Out"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("cancel")),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text("yes")),
        ],
      );
    },
  ).then((value) => value ?? false);
}
