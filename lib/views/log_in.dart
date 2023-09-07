// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hamarasehyog/components/big_tex.dart';
import 'package:hamarasehyog/components/small_grey_text.dart';
import 'package:hamarasehyog/components/square_tile.dart';
import 'package:hamarasehyog/components/text_fields.dart';
import 'package:hamarasehyog/constants/routes.dart';
import 'package:hamarasehyog/utils/colors.dart';

class LogInView extends StatefulWidget {
  const LogInView({super.key});

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
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
      // appBar: AppBar(
      //   title:const Text("Login"),
      // ),
       body: SafeArea(
         child: Center(
           child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ---- log in title ---- //
                 BigText(text: "Log In.", color: AppColors.darkGrey, size: 55),
           
                // ---- white spaces ---- //
                SizedBox(height : 60),
                
                // ---- email field ---- //
                MyTextFields(text: "Email", obscureText: false, enableSuggestions: false, autocorrect: false,inputType: TextInputType.emailAddress,controller: _email,),
           
                // ---- password field ---- //
                MyTextFields(text:"Password", obscureText: true, enableSuggestions: false, autocorrect: false,controller: _password,),
                
                //---- forgot password? ---- //
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal:25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:  [
                      SmallGreyText(text: 'Forgot Password?')
                    ],
                  ),
                ),
           
                // ---- white spaces ---- //
                SizedBox(height: 60),
           
                // --- log in button ---- //
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: MaterialButton(
                    onPressed: () async {
                      final email = _email!.text;
                      final password = _password!.text;
                      try {
                        final userCred =
                            await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );
                        print(userCred);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print(
                              'User not found. Please double-check your entered details');
                        } else if (e.code == "wrong-password") {
                          print('Incorrect password');
                        } else {
                          print('Error: ${e.code}');
                        }
                      } catch (e) {
                        print(e.toString());
                      }
                    },
                    
                    //* styles of button
                    textColor: AppColors.grey,
                    color:  AppColors.mainColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    height: 60,
                    minWidth: 347,
                    child: const Text(
                      "Log In",
                      style:TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold, fontSize: 22)
                      ),
                  ),
                ),
           
                // ---- white spaces ---- //
                SizedBox(height: 50),
           
                // ---- or continue with --- //
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child:  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: AppColors.slateGrey,
                        ),
                      ),
                
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal:10.0),
                        child: Text(
                          "Or continue with",
                          style:TextStyle(color:Colors.grey,)
                        ),
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
                      padding: const EdgeInsets.symmetric(horizontal:15.0),
                      child: SquareTile(imagePath: 'assets/images/google.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:15.0),
                      child: SquareTile(imagePath: 'assets/images/facebook.png'),
                    ),
                  ],
                ),
           
                // white spaces
                SizedBox(height: 40),
           
                // dont have an account?
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        signupRoute,
                        (route) => false,
                      );
                    },
                    child: const Text(
                      "Don't have an account? Sign up here!",
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
