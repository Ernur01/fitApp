import 'package:firebase_auth/firebase_auth.dart';
import 'package:mead_term_2/domain/user.dart';

class AuthServices {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future<UserInApp> signInWithEmailPassword(
      String email, String password) async {
    try {
      UserCredential result = await _fAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return UserInApp.fromFirebase(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<UserInApp> registerWithEmailPassword(
      String email, String password) async {
    try {
      UserCredential result = await _fAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return UserInApp.fromFirebase(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future logOut() async {
    await _fAuth.signOut();
  }

  Stream<UserInApp> get currentUser {
    return _fAuth
        .authStateChanges()
        .map((User user) => user != null ? UserInApp.fromFirebase(user) : null);
  }
}
