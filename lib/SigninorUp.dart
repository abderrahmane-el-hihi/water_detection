import 'package:flutter/material.dart';
import 'package:waterdetection/signuppage.dart';

import 'loginpage.dart';

class SigninorUp extends StatefulWidget {
  const SigninorUp({
    super.key,
  });

  @override
  State<SigninorUp> createState() => _SigninorUpState();
}

class _SigninorUpState extends State<SigninorUp> {
  //initially show loginpage
  bool showLoginPage = true;

  //switch between loginpage and signuppage
  void switchpages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        ontap: switchpages,
      );
    } else {
      return SignUpPage();
    }
  }
}
