import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waterdetection/serianumpage.dart';
import 'SigninorUp.dart';
import 'package:waterdetection/homepage.dart';
import 'package:waterdetection/loginpage.dart';
import 'package:waterdetection/signuppage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //user logged in
            if (snapshot.hasData) {
              return SerialPage();
            } else {
              return SigninorUp();
            }
          }),
    );
  }
}
