import 'package:flutter/material.dart';
import 'package:waterdetection/auth_page.dart';
import 'package:waterdetection/loginpage.dart';
import 'package:waterdetection/productmenupage.dart';
import 'package:waterdetection/serianumpage.dart';
import 'package:waterdetection/signuppage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:waterdetection/testpage.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      //home: SerialPage(),
      //home: ProductMenuPage(),
      //home: MyWidget(),
      //splash screen
      //home: SplashScreen,
    );
  }
}
