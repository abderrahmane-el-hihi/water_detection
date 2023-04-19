import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:hive/hive.dart';
//import 'package:hive_flutter/hive_flutter.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:waterdetection/auth_page.dart';

import 'package:waterdetection/settingspage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:waterdetection/test.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //if not work delete from here
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: false,
  );
  print('User granted permission: ${settings.authorizationStatus}');
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');
    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
  await FirebaseAnalytics.instance.setUserProperty(
    name: 'favorite_food',
    value: 'favoriteFood',
  );

  //to here
  //await Hive.initFlutter();
  runApp(const MyApp());
}

Future<void> loadFont() async {
  await rootBundle.load('assets/fonts/Poppins-Medium.ttf');
}

bool isDarkMode = false;
final FlutterLocalization _localization = FlutterLocalization.instance;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization _localization = FlutterLocalization.instance;

  @override
  void initState() {
    _localization.init(
      mapLocales: [
        MapLocale('en', AppLocale.EN),
        MapLocale('fr', AppLocale.FR),
        MapLocale('ar', AppLocale.AR),
      ],
      initLanguageCode: 'en',
    );
    _localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(builder: (context, notifier, child) {
        return MaterialApp(
          supportedLocales: _localization.supportedLocales,
          localizationsDelegates: _localization.localizationsDelegates,
          theme: notifier.isDark ? ThemeData.dark() : ThemeData.light(),
          debugShowCheckedModeBanner: false,

          // home: Consumer<AuthProvider>(
          //   builder: (context, authProvider, child) {
          //     if (authProvider.user != null) {
          //       return HomePage();
          //     } else {
          //       return AuthPage();
          //     }
          //   },
          // ),
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
      }),
    );
  }
}
