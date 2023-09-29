import 'package:firebase_auth/firebase_auth.dart';
import 'package:hamarasehyog/services/auth/auth_user.dart';

abstract class AuthProvider {
  Future<void> initialize();

  AuthUser? get currentUser;

  Future<AuthUser?> logIn({
    required String email,
    required String password,
  });

  Future<AuthUser> createUser({
    required String email,
    required String password,
    required String name,
  });

  Future<void> logOut();
  Future<void> sendEmailVerification();

  Future<String> verifyNumber(String phonenumber);
  Future<AuthUser?> verifyCode(String id, String otp);

  Future<User?> signInWithGoogle();

  Future passwordReset({required String email});
  Future changePassword();

}
