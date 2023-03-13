import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:waterdetection/auth_page.dart';
import 'package:waterdetection/loginpage.dart';
import 'package:waterdetection/mongodb_config/mongo.dart';
import 'package:waterdetection/productmenupage.dart';
import 'package:waterdetection/serianumpage.dart';
import 'package:waterdetection/signuppage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:waterdetection/test.dart';
import 'package:waterdetection/testanimation.dart';
import 'package:waterdetection/testpage.dart';
import 'firebase_options.dart';
import 'services/biometrics_aut.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await MongodbConf.Connect();
  //if not work delete from here

  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   print('Got a message whilst in the foreground!');
  //   print('Message data: ${message.data}');

  //   if (message.notification != null) {
  //     print('Message also contained a notification: ${message.notification}');
  //   }
  // });

  // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //   print('A new onMessageOpenedApp event was published!');
  //   print('Message data: ${message.data}');
  // });

  //to here
  runApp(const MyApp());
}

Future<void> loadFont() async {
  await rootBundle.load('assets/fonts/Poppins-Medium.ttf');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: AuthPage(),
      //home: SerialPage(),
      //home: ProductMenuPage(),
      //home: MyWidget(),
      // home: Test(),
      //splash screen
      home: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: AuthPage(),
        // title: Text(
        //   'Water Detection App',
        //   style: TextStyle(
        //     color: Color.fromRGBO(0, 78, 131, 10),
        //   ),
        // ),
        //image: Image.asset('assets/social_svg/codrops.svg'),
        photoSize: 100,
      ),
      //home: WaterDrop(),
      //home: FingerprintSwitch(),
      //home: StartScreen(),
    );
  }
}
