import 'package:flutter/material.dart';
import 'package:hamarasehyog/components/big_tex.dart';
import 'package:hamarasehyog/components/small_text.dart';
import 'package:hamarasehyog/components/text_form.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/utils/dimensions.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  get width10 => Dimensions.width10;
  get height10 => Dimensions.height10;
  get radius10 => Dimensions.radius10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(
          text: "Contact Us",
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
              // SizedBox(
              //   height: height10,
              // ),
              Center(child: SmallText(text: "Let's get in touch!",color: AppColors.secondaryBlack,)),
              SizedBox(height: height10*4,),
              Form(
                child: Column(
                  children: [
                    TextForm(
                      label: Text("E-mail"),
                      hintText: "E-mail",
                      icon: Icons.mail_outline_outlined,
                    ),
                    SizedBox(
                      height: height10 * 2,
                    ),
                    TextForm(
                      label: Text("Name"),
                      hintText: "Full Name",
                      icon: Icons.person,
                    ),
                    SizedBox(
                      height: height10 * 2,
                    ),
                    TextForm(
                      label: Text("Phone"),
                      hintText: "Phone",
                      icon: PhosphorIcons.regular.phone,
                    ),
                    SizedBox(
                      height: height10 * 2,
                    ),
                    TextForm(
                      label: Text("Message"),
                      hintText: "Message",
                      icon: PhosphorIcons.regular.handshake,
                    ),
                    SizedBox(
                      height: height10 * 2,
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
}
