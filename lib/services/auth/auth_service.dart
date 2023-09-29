import 'package:firebase_auth/firebase_auth.dart';
import 'package:hamarasehyog/services/auth/auth_provider.dart';
import 'package:hamarasehyog/services/auth/auth_user.dart';
import 'package:hamarasehyog/services/auth/firebase_auth_provider.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;

  factory AuthService.firebase() => AuthService(FirebaseAuthProvider());

  const AuthService(this.provider);

  @override
  Future<AuthUser> createUser(
          {required String email, required String password,required String name}) =>
      provider.createUser(email: email, password: password,name:name);

  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser?> logIn({required String email, required String password}) =>
      provider.logIn(email: email, password: password);

  @override
  Future<void> logOut() => provider.logOut();

  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();

  @override
  Future<void> initialize() => provider.initialize();

  @override
  Future<AuthUser?> verifyCode(String id, String otp) => provider.verifyCode(id,otp);

  @override
  Future<String> verifyNumber(String phonenumber) => provider.verifyNumber(phonenumber);

  @override
  Future<User?> signInWithGoogle() => provider.signInWithGoogle();

  @override
  Future passwordReset({required String email}) =>
      provider.passwordReset(email: email);

  @override
  Future changePassword() => provider.changePassword();
}
