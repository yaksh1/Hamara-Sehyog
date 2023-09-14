import 'package:flutter/material.dart';
import 'package:hamarasehyog/components/big_tex.dart';
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
  get width10 => Dimensions.width10;
  get height10 => Dimensions.height10;
  get radius10 => Dimensions.radius10;

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
              Center(
                  child: BigText(
                text: "Join Us",
                color: AppColors.mainColor,
                size: 50,
              )),
              SizedBox(
                height: height10 * 4,
              ),

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
                      hintText: "Name",
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
        ),
      ),
    );
  }
}