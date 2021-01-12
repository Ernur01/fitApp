import 'package:firebase_auth/firebase_auth.dart';

class UserInApp {
  String id;

  UserInApp.fromFirebase(User fUser) {
    id = fUser.uid;
  }
}
