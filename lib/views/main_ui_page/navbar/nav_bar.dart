// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamarasehyog/components/big_tex.dart';
import 'package:hamarasehyog/components/responsive_text.dart';
import 'package:hamarasehyog/components/small_text.dart';
import 'package:hamarasehyog/constants/routes.dart';
import 'package:hamarasehyog/enums/drawer_sections.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/dimensions.dart';
import 'package:hamarasehyog/utils/image_strings.dart';
import 'package:hamarasehyog/utils/text_strings.dart';
import 'package:hamarasehyog/views/contact%20us/contact_us.dart';
import 'package:hamarasehyog/views/log_in.dart';
import 'package:hamarasehyog/views/main_ui_page/categories/categories.dart';
import 'package:hamarasehyog/views/main_ui_page/main_ui_page.dart';
import 'package:hamarasehyog/views/main_ui_page/texts/paragraph_text.dart';
import 'package:hamarasehyog/views/main_ui_page/navbar/nav_bar.dart';
import 'package:hamarasehyog/views/main_ui_page/slide_show/slide_show.dart';
import 'package:hamarasehyog/views/main_ui_page/texts/dual_color_text.dart';
import 'package:hamarasehyog/views/my%20donations/my_donations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  double width10 = Dimensions.width10;
  double height10 = Dimensions.height10;
  double radius10 = Dimensions.radius10;
  var currentPage = DrawerSections.home;
  @override
  Widget build(BuildContext context) {
    // print("current width is " + MediaQuery.of(context).size.width.toString());
    Widget container;
    if (currentPage == DrawerSections.home) {
      container = MainUI();
    } else if (currentPage == DrawerSections.contactUs) {
      container = ContactUs();
    } else if (currentPage == DrawerSections.myDonations) {
      container = MyDonations();
    } else if (currentPage == DrawerSections.logout) {
      Get.to(LogInView());
    }
    return Scaffold(
      // side menu
      drawer: Drawer(
        backgroundColor: AppColors.secondaryBlack,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                // MyHeaderDrawer(),
                SizedBox(
                  height: 50,
                ),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
      // background color of page
      backgroundColor: AppColors.secondaryBlack,
      // header
      appBar: AppBar(
        title: Image.asset(appLogo2),
        centerTitle: true,
        // automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryBlack,
        iconTheme: IconThemeData(color: AppColors.grey, size: 35),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: OutlinedButton(
              onPressed: () {},
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
          )
        ],
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(top: height10 * 1.5),
      child: Column(
        // list of menu
        children: [
          menuItem(1, "Home", PhosphorIcons.duotone.house,
              currentPage == DrawerSections.home ? true : false),
          menuItem(2, "My Donations", PhosphorIcons.duotone.money,
              currentPage == DrawerSections.myDonations ? true : false),
          menuItem(3, "Certificates", PhosphorIcons.duotone.cards,
              currentPage == DrawerSections.certificates ? true : false),
          menuItem(4, "Members", PhosphorIcons.duotone.user,
              currentPage == DrawerSections.members ? true : false),
          menuItem(5, "About Us", PhosphorIcons.duotone.lightbulb,
              currentPage == DrawerSections.aboutUs ? true : false),
          menuItem(6, "ContactUs", PhosphorIcons.duotone.phone,
              currentPage == DrawerSections.contactUs ? true : false),
          menuItem(7, "Settings", PhosphorIcons.duotone.gear,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(8, "Log out", Icons.logout,
              currentPage == DrawerSections.logout ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.orange.shade400 : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.home;
            } else if (id == 2) {
              currentPage = DrawerSections.myDonations;
            } else if (id == 3) {
              currentPage = DrawerSections.certificates;
            } else if (id == 4) {
              currentPage = DrawerSections.members;
            } else if (id == 5) {
              currentPage = DrawerSections.aboutUs;
            } else if (id == 6) {
              currentPage = DrawerSections.contactUs;
            } else if (id == 7) {
              currentPage = DrawerSections.settings;
            } else if (id == 8) {
              currentPage = DrawerSections.logout;
            }
          });
        },
        child: Padding(
            padding: EdgeInsets.all(height10 * 1.5),
            child: Row(
              children: [
                Expanded(
                  child: Icon(
                    icon,
                    size: height10 * 2,
                    color: AppColors.grey,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: SmallText(
                    text: title,
                    color: AppColors.grey,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
