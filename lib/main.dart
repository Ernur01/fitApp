import 'package:flutter/material.dart';
import 'package:mead_term_2/domain/user.dart';
import 'package:mead_term_2/screens/landing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mead_term_2/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:mead_term_2/core/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserInApp>.value(
      value: AuthServices().currentUser,
      child: MaterialApp(
          title: 'Fitness App',
          theme: ThemeData(
              primaryColor: bgColorPrimary,
              textTheme: TextTheme(headline6: TextStyle(color: Colors.white))),
          home: LandingPage()),
    );
  }
}
