import 'package:flutter/material.dart';
import 'package:mead_term_2/domain/user.dart';
import 'package:mead_term_2/screens/auth.dart';
import 'package:provider/provider.dart';
import 'home.dart';

class LandingPage extends StatelessWidget {
  LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserInApp user = Provider.of<UserInApp>(context);
    final bool isLoggedIn = user != null;

    return isLoggedIn ? HomePage() : AuthorizationPage();
  }
}
