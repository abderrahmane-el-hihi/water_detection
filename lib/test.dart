import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:mongo_dart/mongo_dart.dart' show Db;
import 'package:waterdetection/components/text_field.dart';
import 'package:waterdetection/services/local_notif_service.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'components/gnavbar.dart';
import "mongodb_config/mongo.dart";

class Test extends StatefulWidget {
  Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late Timer timer;
  late Map<String, dynamic> data = {
    'email': emailcontroller.text,
    'password': passcontroller.text,
    'username': usernamecontroller.text,
    'id_compt': 4,
  };

  var document = {
    'email': 'John Doe',
    'password': 'john.doe@example.com',
  };
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final usernamecontroller = TextEditingController();
  final idcontroller = TextEditingController();

  bool isDarkMode = false;
  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Center(
    //     child: SizedBox(
    //       height: 600,
    //       child: Column(
    //         children: [
    //           Text_Field(
    //               controller: emailcontroller,
    //               hinText: 'email',
    //               obsecureText: false,
    //               preicon: Icons.cloud),
    //           Text_Field(
    //               controller: passcontroller,
    //               hinText: 'password',
    //               obsecureText: false,
    //               preicon: Icons.cloud),
    //           Text_Field(
    //               controller: usernamecontroller,
    //               hinText: 'username',
    //               obsecureText: false,
    //               preicon: Icons.cloud),
    //           Text_Field(
    //               controller: idcontroller,
    //               hinText: 'id',
    //               obsecureText: false,
    //               preicon: Icons.cloud),
    //           ElevatedButton.icon(
    //             onPressed: () => MongodbConf.WriteDataToMongo("compt", data),
    //             icon: Icon(Icons.cloud),
    //             label: Text("send"),
    //           ),
    //           ElevatedButton.icon(
    //             onPressed: () {
    //               Notif.showBigTextNotification(
    //                   title: "test notification",
    //                   body: "sir 3amer  chateau t9awed",
    //                   fln: flutterLocalNotificationsPlugin);
    //             },
    //             icon: Icon(Icons.cloud),
    //             label: Text("notification"),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dark Mode Switch'),
          elevation: 0,
        ),
        //bottomNavigationBar: GNavBar(),
        body: Center(
          child: ElevatedButton(
            child: const Text('English'),
            onPressed: () {
              localization.translate('en');
            },
          ),
        ),
      ),
    );
  }
}

////////////////////////test flutter_localization //////////////
// import 'package:flutter/material.dart';
// import 'package:flutter_localization/flutter_localization.dart';

// void main() {
//   runApp(const Test());
// }

// class Test extends StatefulWidget {
//   const Test({super.key});

//   @override
//   State<Test> createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   final FlutterLocalization _localization = FlutterLocalization.instance;

//   @override
//   void initState() {
//     _localization.init(
//       mapLocales: [
//         const MapLocale('en', AppLocale.EN),
//         const MapLocale('km', AppLocale.KM),
//         const MapLocale('ja', AppLocale.JA),
//       ],
//       initLanguageCode: 'en',
//     );
//     _localization.onTranslatedLanguage = _onTranslatedLanguage;
//     super.initState();
//   }

//   void _onTranslatedLanguage(Locale? locale) {
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       supportedLocales: _localization.supportedLocales,
//       localizationsDelegates: _localization.localizationsDelegates,
//       home: const SettingsScreen(),
//     );
//   }
// }

// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({super.key});

//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   final FlutterLocalization _localization = FlutterLocalization.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(AppLocale.title.getString(context))),
//       body: Container(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Current language is: ${_localization.getLanguageName()}'),
//             const SizedBox(height: 64.0),
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     child: const Text('English'),
//                     onPressed: () {
//                       _localization.translate('en');
//                     },
//                   ),
//                 ),
//                 const SizedBox(width: 8.0),
//                 Expanded(
//                   child: ElevatedButton(
//                     child: const Text('ភាសាខ្មែរ'),
//                     onPressed: () {
//                       _localization.translate('km');
//                     },
//                   ),
//                 ),
//                 const SizedBox(width: 8.0),
//                 Expanded(
//                   child: ElevatedButton(
//                     child: const Text('日本語'),
//                     onPressed: () {
//                       _localization.translate('ja', save: false);
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// mixin AppLocale {
//   static const String title = 'title';

//   static const Map<String, dynamic> EN = {title: 'Localization'};
//   static const Map<String, dynamic> KM = {title: 'ការធ្វើមូលដ្ឋានីយកម្ម'};
//   static const Map<String, dynamic> JA = {title: 'ローカリゼーション'};
// }
