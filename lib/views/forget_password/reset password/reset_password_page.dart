import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamarasehyog/components/big_tex.dart';
import 'package:hamarasehyog/components/my_snackbar.dart';
import 'package:hamarasehyog/components/password_text_field.dart';
import 'package:hamarasehyog/components/text_form.dart';
import 'package:hamarasehyog/services/auth/auth_service.dart';
import 'package:hamarasehyog/utils/colors.dart';
import 'package:hamarasehyog/views/log_in.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  TextEditingController _newPassword = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  @override
  void initState() {
    _newPassword = TextEditingController();
    _confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _newPassword.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  //! <---- global form key -----> //
  final _formKey = GlobalKey<FormState>();

  var newPassword = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        body: SafeArea(
      child: Center(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const BigText(
              text: "Reset Password",
              color: AppColors.primaryBlack,
            ),
            const SizedBox(
              height: 30,
            ),
            PasswordTextField(
                controller: _newPassword,
                labelText: "New Password",
                hintText: "enter new password"),
            const SizedBox(
              height: 5,
            ),
            PasswordTextField(
                controller: _newPassword,
                labelText: "Confirm Password",
                hintText: "enter your new password again"),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      _newPassword.text == _confirmPassword.text) {
                    setState(() {
                      newPassword = _newPassword.text;
                    });
                    changePassword();
                  }
                },
                textColor: AppColors.grey,
                color: AppColors.primaryBlack,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                height: 60,
                child: const Text(
                  "Change Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
          ]),
        ),
      )),
    ));
  }

  final user = FirebaseAuth.instance.currentUser;
  Future changePassword() async {
    try {
      await user!.updatePassword(newPassword);
      AuthService.firebase().logOut();
      MySnackBar().mySnackBar(
        header: "Password Changed",
        content: "Your Password has been changed, login again!",
      );
      Get.to(() => LogInView());
    } catch (e) {
      MySnackBar().mySnackBar(
        header: "Error",
        content: e.toString(),
        bgColor: Colors.red.shade200,
        borderColor: Colors.red,
      );
    }
  }
}
