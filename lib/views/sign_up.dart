// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hamarasehyog/components/big_tex.dart';
import 'package:hamarasehyog/components/error_dialog.dart';
import 'package:hamarasehyog/components/square_tile.dart';
import 'package:hamarasehyog/components/text_fields.dart';
import 'package:hamarasehyog/constants/routes.dart';
import 'package:hamarasehyog/utils/colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController? _phone;
  TextEditingController? _name;
  TextEditingController? _email;
  TextEditingController? _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _name = TextEditingController();
    _phone = TextEditingController();
    super.initState();
  }

  // @override
  // void dispose() {
  //   _email?.dispose();
  //   _password?.dispose();
  //   _name?.dispose();
  //   _phone?.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ---- sign up title ---- //
                BigText(text: "Sign Up.", color: AppColors.darkGrey, size: 55),

                // ---- white spaces ---- //
                SizedBox(height: 40),

                // ---- name field ---- //
                MyTextFields(
                  text: "Name",
                  obscureText: false,
                  enableSuggestions: true,
                  autocorrect: false,
                  controller: _name,
                ),

                // ---- email field ---- //
                MyTextFields(
                  text: "Email",
                  obscureText: false,
                  enableSuggestions: false,
                  autocorrect: false,
                  inputType: TextInputType.emailAddress,
                  controller: _email,
                ),

                // ---- password field ---- //
                MyTextFields(
                  text: "Password",
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: _password,
                ),

                // // ---- phone field ---- //
                // MyTextFields(
                //   text: "Phone",
                //   obscureText: false,
                //   enableSuggestions: false,
                //   autocorrect: false,
                //   controller: _phone,
                // ),

                // ---- white spaces ---- //
                SizedBox(height: 40),

                // ---- sign up button ---- //
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: MaterialButton(
                    onPressed: () async {
                      final email = _email!.text;
                      final password = _password!.text;
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: email,
                          password: password,
                        );

                        // ---- when clicked on sign up button ---- //
                        final user = FirebaseAuth.instance.currentUser;
                        user?.sendEmailVerification();
                        Navigator.of(context).pushNamed(
                          verifyEmailRoute,
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showErrorDialog(
                              context, 'Weak-password, please modify it.');
                        } else if (e.code == "channel-error") {
                          showErrorDialog(context,
                              'Email or password is empty, kindly check again.');
                        } else if (e.code == "email-already-in-use") {
                          showErrorDialog(context, 'Email already in use.');
                        } else if (e.code == "invalid-email") {
                          showErrorDialog(
                              context, 'Invalid email, please check again.');
                        } else {
                          showErrorDialog(context, 'Error: ${e.code}');
                        }
                      } catch (e) {
                        showErrorDialog(context, e.toString());
                      }
                    },
                    //* styles of button
                    textColor: AppColors.grey,
                    color: AppColors.mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    height: 60,
                    minWidth: 347,
                    child: const Text("Sign Up",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 22)),
                  ),
                ),

                // ---- white spaces ---- //
                SizedBox(height: 40),

                // ---- or continue with --- //
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: AppColors.slateGrey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("Or continue with",
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: AppColors.slateGrey,
                        ),
                      ),
                    ],
                  ),
                ),

                // white spaces
                SizedBox(height: 50),

                // ---- log in options ---- //
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: SquareTile(imagePath: 'assets/images/google.png',height: 40,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child:
                          SquareTile(imagePath: 'assets/images/facebook.png',height: 40,),
                    ),
                  ],
                ),

                // ---- white spaces ---- //
                SizedBox(height: 40),

                // ---- already have an account? login route ---- //
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      loginRoute,
                      (route) => false,
                    );
                  },
                  child: const Text(
                    "Already have an account? Login here!",
                    style: TextStyle(color: AppColors.mainColor),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
