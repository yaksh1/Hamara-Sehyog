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
import 'package:hamarasehyog/views/about%20us/about_us.dart';
import 'package:hamarasehyog/views/contact%20us/contact_us.dart';
import 'package:hamarasehyog/views/donation/donation.dart';
import 'package:hamarasehyog/views/gallery/gallery.dart';
import 'package:hamarasehyog/views/join%20us/join_us.dart';
import 'package:hamarasehyog/views/log_in.dart';
import 'package:hamarasehyog/views/main_ui_page/categories/categories.dart';
import 'package:hamarasehyog/views/main_ui_page/texts/paragraph_text.dart';
import 'package:hamarasehyog/views/main_ui_page/navbar/nav_bar.dart';
import 'package:hamarasehyog/views/main_ui_page/slide_show/slide_show.dart';
import 'package:hamarasehyog/views/main_ui_page/texts/dual_color_text.dart';
import 'package:hamarasehyog/views/members/members.dart';
import 'package:hamarasehyog/views/projects/projects.dart';
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
      // background color of page
      backgroundColor: Color(0xFFF5F5F5),

      // header
      appBar: AppBar(
        title: Image.asset(appLogo2),
        automaticallyImplyLeading: false,
        // centerTitle: true,
        // automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFF5F5F5),
        iconTheme: IconThemeData(color: AppColors.secondaryBlack, size: 35),
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
                    Get.to(() => LogInView());
                  }
                case MenuAction.aboutUs:
                  Get.to(() => AboutUs());
                case MenuAction.members:
                  Get.to(() => Members());
                case MenuAction.projects:
                  Get.to(() => Projects());
                case MenuAction.joinUs:
                  Get.to(() => JoinUs());
                case MenuAction.gallery:
                  Get.to(() => Gallery());
                case MenuAction.contactUs:
                  Get.to(() => ContactUs());

                
              }
            },
            itemBuilder: (context) {
              return [
                
                const PopupMenuItem(
                    value: MenuAction.projects, child: Text("Our Projects")),
                const PopupMenuItem(
                    value: MenuAction.gallery, child: Text("Gallery")),
                const PopupMenuItem(
                    value: MenuAction.members, child: Text("Members")),
                const PopupMenuItem(
                    value: MenuAction.joinUs, child: Text("Join Us")),
                const PopupMenuItem(
                    value: MenuAction.aboutUs, child: Text("About Us")),
                const PopupMenuItem(
                    value: MenuAction.contactUs, child: Text("Contact Us")),
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
                text: "Together We Can Make",
                color: AppColors.secondaryBlack,
                size: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BigText(
                    text: "the Society",
                    color: AppColors.secondaryBlack,
                    size: 30),
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
              color: AppColors.secondaryBlack,
            ),
            // space
            SizedBox(
              height: height10,
            ),

            // intro text description
            ParagraphText(
              width10: width10,
              text: introText,
              color: AppColors.primaryBlack,
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
                    color: AppColors.secondaryBlack,
                  ),
                  // paragraph
                  ParagraphText(
                    width10: width10,
                    text: joinOurTeamDetails,
                    size: 16,
                    color: AppColors.secondaryBlack,
                  ),
                  // dual color title
                  DualColorText(
                    text1: "Donate Your ",
                    text2: timeAndSkills,
                    size: 25,
                    color: AppColors.secondaryBlack,
                  ),
                  // paragraph
                  ParagraphText(
                    color: AppColors.secondaryBlack,
                    width10: width10,
                    text: timeAndSkillsDetails,
                    size: 16,
                  ),
                  // dual color title
                  DualColorText(
                    color: AppColors.secondaryBlack,
                    text1: "Donate Your ",
                    text2: sponsorship,
                    size: 25,
                  ),
                  // paragraph
                  ParagraphText(
                    color: AppColors.secondaryBlack,
                    width10: width10,
                    text: sponsorshipDetails,
                    size: 16,
                  ),
                  // join us button
                  Padding(
                    padding: EdgeInsets.only(bottom: height10 * 2),
                    child: Center(
                      child: OutlinedButton(
                        onPressed: () {
                          Get.to(() => JoinUs());
                        },
                        style: OutlinedButton.styleFrom(
                            elevation: 5,
                            shadowColor: AppColors.primaryBlack,
                            side: BorderSide(
                              color: AppColors.primaryBlack,
                              width: 3,
                            ),
                            backgroundColor: AppColors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: SmallText(
                            text: "Join us ->",
                            color: AppColors.secondaryBlack),
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
