import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hamarasehyog/firebase_options.dart';
import 'package:hamarasehyog/services/auth/auth_provider.dart';
import 'package:hamarasehyog/services/auth/auth_user.dart';
import 'package:hamarasehyog/services/auth/auth_exceptions.dart';

import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseAuthException, GoogleAuthProvider, PhoneAuthCredential, PhoneAuthProvider, User, UserCredential;
import 'package:logger/logger.dart';

class FirebaseAuthProvider implements AuthProvider {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final auth = FirebaseAuth.instance;
  User? userForGoogle;
  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
    required String name
  }) async {
    // implement createUser
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      //! save user to database
      await saveUSerEmailPass(email, name);
      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeakPasswordAuthException();
      } else if (e.code == "channel-error") {
        throw EmptyFieldAuthException();
      } else if (e.code == "email-already-in-use") {
        throw EmailAlreadyInUseAuthException();
      } else if (e.code == "invalid-email") {
        throw InvalidEmailAuthException();
      } else {
        throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }

  @override
  // implement currentUser
  AuthUser? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return AuthUser.fromFirebase(user);
    } else {
      return null;
    }
  }

  @override
  Future<AuthUser?> logIn(
      {required String email, required String password}) async {
    // implement logIn
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFoundAuthException();
      } else if (e.code == "wrong-password") {
        throw WrongPasswordAuthException();
      } else {
        throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }

  @override
  Future<void> logOut() async {
    // implement logOut
    final currentUser = FirebaseAuth.instance.currentUser;
    if (googleSignIn.currentUser != null) {
      Logger().d("Sign out using google");
      await googleSignIn.signOut();
    }
    if (currentUser != null) {
      Logger().d("Sign out using firebaseAuth");
      await FirebaseAuth.instance.signOut();
    }
    try {
      await googleSignIn.disconnect();
    } catch (e) {
      Logger().d("failed to disconnect on signout");
    }
  }

  @override
  Future<void> sendEmailVerification() async {
    // implement sendEmailVerification
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    } else {
      throw UserNotLoggedInAuthException();
    }
  }

  @override
  Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  @override
  Future<AuthUser?> verifyCode(String id, String otp) async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: id, smsCode: otp);

    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((authResult) {
      print(authResult.user);
    });
    final user = currentUser;
    log("current");
    return user;
  }

  @override
  Future<String> verifyNumber(String phonenumber) async {
    String verificationCode = "";
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91$phonenumber",
        verificationCompleted: (PhoneAuthCredential credential) async {
          FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) => {
                    if (value.user != null)
                      {
                        // to do later
                      }
                  });
        },
        verificationFailed: (FirebaseAuthException exception) {},
        codeSent: (String verificationID, int? resendToken) {
          verificationCode = verificationID;

          // Navigator.push(context,
          //                   MaterialPageRoute(builder: (context) => OtpScreen(phonenumber: phonenumber,verificationIDrecieved: verificationIDrecieved,)));
        },
        codeAutoRetrievalTimeout: (String verificationID) {},
        timeout: const Duration(seconds: 60));
    return verificationCode;
  }

  @override
  Future<User?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    // if user canceled the operation
    if (googleUser == null) {
      Logger().d("Operation Canceled");
    }

    // Obtain the auth details from the request

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    try {
      // Once signed in, return the UserCredential
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);
      //! save user in data collection
      await saveUser(googleUser);
      userForGoogle = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        Get.showSnackbar(const GetSnackBar(
          message:
              "You already have an account with this email. Use other login method.",
          duration: Duration(seconds: 3),
        ));
      } else if (e.code == 'invalid-credential') {
        Get.showSnackbar(const GetSnackBar(
          message: "Invalid Credential!",
          duration: Duration(seconds: 3),
        ));
      } else if (e.code == 'wrong-password') {
        Get.showSnackbar(const GetSnackBar(
          message: "Wrong password!",
          duration: Duration(seconds: 3),
        ));
      }
    } catch (e) {
      Get.showSnackbar(const GetSnackBar(
        message: "Unknown Error. Try again later",
        duration: Duration(seconds: 3),
      ));
    }
    return userForGoogle;
  }

    saveUser(GoogleSignInAccount? googleUser) {
    FirebaseFirestore.instance.collection("users").doc(googleUser!.email).set({
      "email": googleUser.email,
      "name": googleUser.displayName,
      "profilePic": googleUser.photoUrl
    });

    Logger().d("Saved user data");
  }

  saveUSerEmailPass(String email, String username) {
    FirebaseFirestore.instance.collection("users").doc(email).set({
      'email': email,
      'name': username,
    });
  }
}
