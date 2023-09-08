import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hamarasehyog/constants/routes.dart';
import 'package:hamarasehyog/views/detail_view.dart';
import 'package:hamarasehyog/views/log_in.dart';
import 'package:hamarasehyog/views/sign_up.dart';
import 'package:hamarasehyog/views/verify_email_view.dart';

import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          fontFamily: 'Poppins'
        ),
        home: const HomePage(),
        routes: {
          signupRoute: (context) => const SignUp(),
          loginRoute: (context) => const LogInView(),
          detailsRoute: (context) => const DetailsView(),
          verifyEmailRoute: (context) => const VerifyEmailView(),
        }),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return const VerifyEmailView();
            // final user = FirebaseAuth.instance.currentUser;
            // if (user != null) {
            //   if (user.emailVerified) {
            //     return const DetailsView();
            //   } else {
            //     return const VerifyEmailView();
            //   }
            // } else {
            //   return const LogInView();
            // }
            default:
              // write loading code here
              return const CircularProgressIndicator();
          }
        });
  }
}
