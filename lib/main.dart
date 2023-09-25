import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamarasehyog/constants/routes.dart';
import 'package:hamarasehyog/firebase_options.dart';
import 'package:hamarasehyog/services/auth/auth_service.dart';
import 'package:hamarasehyog/views/about%20us/about_us.dart';
import 'package:hamarasehyog/views/donation/donation.dart';
import 'package:hamarasehyog/views/gallery/gallery.dart';
import 'package:hamarasehyog/views/log_in.dart';
import 'package:hamarasehyog/views/main_ui_page/main_ui_page.dart';
import 'package:hamarasehyog/views/members/members.dart';
import 'package:hamarasehyog/views/on_boarding/on_boarding_view.dart';
import 'package:hamarasehyog/views/projects/projects.dart';
import 'package:hamarasehyog/views/sign_up.dart';
import 'package:hamarasehyog/views/splash%20screen/splash_screen.dart';
import 'package:hamarasehyog/views/verify_email_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isViewed;

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
  runApp(
    GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
            fontFamily: 'Poppins'),
        defaultTransition: Transition.leftToRight,
        transitionDuration: const Duration(milliseconds: 500),
        // home: isViewed!=0? OnBoardingView() : const HomePage(),
        home: SplashScreen(),
        // home: const Gallery(),
        routes: {
          signupRoute: (context) => const SignUp(),
          loginRoute: (context) => const LogInView(), 
          mainUIRoute: (context) => const MainUI(),
          verifyEmailRoute: (context) => const VerifyEmailView(),
        }),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AuthService.firebase().initialize(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              // return OnBoardingView();
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const MainUI();
              } else {
                return const VerifyEmailView();
              }
            } else {
              return const LogInView();
            }
            default:
              // write loading code here
              return const CircularProgressIndicator();
          }
        });
  }
}
