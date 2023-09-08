import 'package:hamarasehyog/services/auth/auth_provider.dart';
import 'package:hamarasehyog/services/auth/auth_user.dart';
import 'package:hamarasehyog/services/auth/auth_exceptions.dart';

import 'package:firebase_auth/firebase_auth.dart'
    show FirebaseAuth, FirebaseAuthException;

class FirebaseAuthProvider implements AuthProvider {
  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) async {
    // implement createUser
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
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
        GenericAuthException();
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
  Future<AuthUser?> logIn({required String email, required String password}) {
    // implement logIn
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() {
    // implement logOut
    throw UnimplementedError();
  }

  @override
  Future<void> sendEmailVerification() {
    // implement sendEmailVerification
    throw UnimplementedError();
  }
}
