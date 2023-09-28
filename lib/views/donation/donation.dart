// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamarasehyog/components/big_tex.dart';
import 'package:hamarasehyog/components/button.dart';
import 'package:hamarasehyog/components/email_text_field.dart';
import 'package:hamarasehyog/components/input_decoration.dart';
import 'package:hamarasehyog/components/name_text_field.dart';
import 'package:hamarasehyog/components/text_form.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/dimensions.dart';
import 'package:hamarasehyog/views/donation/bank_to_bank.dart';
import 'package:hamarasehyog/views/donation/payment.dart';
import 'package:hamarasehyog/views/donation/send_items.dart';
import 'package:intl/intl.dart';

class Donation extends StatefulWidget {
  const Donation({super.key});

  @override
  State<Donation> createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  //! <---- decoration class -----> //
  MyDecoration decor = MyDecoration();

  //! <---- global form key -----> //
  final _formKey = GlobalKey<FormState>();

  //! <---- categories -----> //
  final _categories = [
    'Donate Money',
    'Books',
    'Tree Saplings',
    'Food',
    'Other Items'
  ];
  //! <---- date time -----> //
  var date = DateFormat('dd-MM-yyyy').format(DateTime.now());

  //! <---- controllers -----> //
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();

  @override
  void initState() {
    _email = TextEditingController();
    _name = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _name.dispose();

    super.dispose();
  }

  String? _currentItemSelected = 'Donate Money';
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: BigText(
                    text: "Donate",
                    color: AppColors.mainColor,
                    size: 50,
                  )),
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
                        border: Border.all(
                            color: AppColors.primaryBlack, width: 2)),
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
                  //! <---- email field -----> //
                  EmailTextField(controller: _email),
                  SizedBox(
                    height: height10 * 2,
                  ),
                  //! <---- name text field -----> //
                  NameTextField(controller: _name),
                  SizedBox(
                    height: height10 * 2,
                  ),
                  OrangeButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        saveDonationData(_email.text, _name.text);
                        Get.to(() => Payment());
                      }
                    },
                    text: "Scan Qr",
                    borderRadius: radius10 * 1.5,
                  ),
                  SizedBox(
                    height: height10 * 2,
                  ),
                  OrangeButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        saveDonationData(_email.text, _name.text);
                        Get.to(() => Bank());
                      }
                    },
                    text: "Bank to Bank",
                    borderRadius: radius10 * 1.5,
                  ),
                  SizedBox(
                    height: height10 * 2,
                  ),
                  OrangeButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        saveDonationData(_email.text, _name.text);
                        Get.to(() => Items());
                      }
                    },
                    text: "Send Items",
                    borderRadius: radius10 * 1.5,
                  ),
                  SizedBox(
                    height: height10 * 2,
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void _onDropDwnItemSelected(String? newValueSelected) {
    setState(() {
      _currentItemSelected = newValueSelected;
    });
  }

  saveDonationData(String email, String username) {
    FirebaseFirestore.instance.collection("donationData").doc(email).set({
      'type': _currentItemSelected,
      'email': email,
      'name': username,
      'date': date,
    });
  }
}




