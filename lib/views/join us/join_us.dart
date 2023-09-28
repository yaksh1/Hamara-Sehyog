// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hamarasehyog/components/big_tex.dart';
import 'package:hamarasehyog/components/email_text_field.dart';
import 'package:hamarasehyog/components/error_dialog.dart';
import 'package:hamarasehyog/components/name_text_field.dart';
import 'package:hamarasehyog/components/phone_text_field.dart';
import 'package:hamarasehyog/components/text_form.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/dimensions.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class JoinUs extends StatefulWidget {
  const JoinUs({super.key});

  @override
  State<JoinUs> createState() => _JoinUsState();
}

class _JoinUsState extends State<JoinUs> {

    //! <---- global form key -----> //
  final _formKey = GlobalKey<FormState>();

  get width10 => Dimensions.width10;
  get height10 => Dimensions.height10;
  get radius10 => Dimensions.radius10;

  //! <---- controllers -----> //
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _message = TextEditingController();

  @override
  void initState() {
    // TODO: implement init
    _email = TextEditingController();
    _name = TextEditingController();
    _phone = TextEditingController();
    _message = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _name.dispose();
    _phone.dispose();
    _message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(
          text: "Join Us",
          color: AppColors.mainColor,
          size: 40,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width10 * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height10 * 4,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    //! <---- email field -----> //
                    EmailTextField(controller: _email),
                    SizedBox(
                      height: height10 *2,
                    ),
                    //! <---- name field -----> //
                    NameTextField(controller: _name),
                    SizedBox(
                      height: height10 * 2,
                    ),
                    //! <---- phone field -----> //
                    PhoneTextField(controller: _phone),
                    SizedBox(
                      height: height10 * 2,
                    ),
                    TextForm(
                      controller: _message,
                      label: Text("Message"),
                      hintText: "Why would you like to join us?",
                      icon: PhosphorIcons.regular.handshake,
                    ),
                    SizedBox(
                      height: height10 * 2,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            
                          String email = _email.text;
                          String phone = _phone.text;
                          String name = _name.text;
                          String message = _message.text;

                          //$ save data to collection
                          saveJoinUsData(email, name, phone, message);
                          showErrorDialog(
                              context, "Our team will contact you soon.",
                              title: "Thanks for submitting!");
                          }
                        },
                        textColor: AppColors.grey,
                        color: AppColors.primaryBlack,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        height: 60,
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  saveJoinUsData(String email, String username, String phone, String message) {
    FirebaseFirestore.instance.collection("volunteers").doc(email).set({
      'email': email,
      'name': username,
      'phone': phone,
      'message': message,
    });
  }
}
