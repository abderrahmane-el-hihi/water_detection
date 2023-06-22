import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waterdetection/serianumpage.dart';
import 'SigninorUp.dart';
import 'productmenupage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  fct() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isSerialNumberEntered =
        prefs.getBool('isSerialNumberEntered') ?? false;
    return isSerialNumberEntered;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //user logged in
            if (snapshot.hasData) {
              // if (fct()) {
              //   return ProductMenuPage();
              // }
              return SerialPage();
            } else {
              return SigninorUp();
            }
          }),
    );
  }
}
