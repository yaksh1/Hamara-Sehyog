import 'package:flutter/material.dart';
import 'package:hamarasehyog/components/big_tex.dart';
import 'package:hamarasehyog/components/text_form.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/dimensions.dart';

class Donation extends StatefulWidget {
  const Donation({super.key});

  @override
  State<Donation> createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  var _categories = ['Money', 'Books', 'Tree Saplings', 'Food', 'Other Items'];
  String? _currentItemSelected = 'Money';
  double width10 = Dimensions.width10;
  double height10 = Dimensions.height10;
  double radius10 = Dimensions.radius10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width10 * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: BigText(text: "Donate", color: AppColors.mainColor,size: 50,)),
                SizedBox(
                  height: height10 * 4,
                ),
                BigText(
                  text: "Select One Option",
                  color: AppColors.primaryBlack,
                  size: height10 * 2.2,
                  weight: FontWeight.w600,
                ),
                SizedBox(
                  height: height10,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: width10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius10),
                      border:
                          Border.all(color: AppColors.primaryBlack, width: 2)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      iconSize: height10 * 3,
                      style: TextStyle(
                          color: AppColors.primaryBlack,
                          fontSize: height10 * 1.6,
                          fontWeight: FontWeight.w500),
                      items: _categories.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(dropDownStringItem),
                        );
                      }).toList(),
                      isExpanded: true,
                      onChanged: (String? newValueSelected) {
                        _onDropDwnItemSelected(newValueSelected);
                      },
                      value: _currentItemSelected,
                    ),
                  ),
                ),
                SizedBox(
                  height: height10 * 4,
                ),
                Form(
                  child: Column(
                    children: [
                      TextForm(
                        label: Text("E-mail"),
                        hintText: "E-mail",
                        icon:Icons.mail_outline_outlined,
                      ),
                      SizedBox(
                        height: height10*2,
                      ),
                      TextForm(
                        label: Text("Name"),
                        hintText: "Name",
                        icon:Icons.person,
                      ),
                      SizedBox(height: height10*2,),
                      TextForm(
                        label: Text("Amount"),
                        hintText: "Amount",
                        icon:Icons.money_outlined,
                      ),
                      SizedBox(
                        height: height10*2,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed: () {
                            // Get.to(() => ForgotPasswordOtp());
                          },
                          textColor: AppColors.grey,
                          color: AppColors.primaryBlack,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          height: 60,
                          child: const Text(
                            "Next",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  void _onDropDwnItemSelected(String? newValueSelected) {
    setState(() {
      _currentItemSelected = newValueSelected;
    });
  }
}


