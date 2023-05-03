import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:waterdetection/Firebasedb_config/firebase_db.dart';
import 'package:waterdetection/services/local_notif_service.dart';
import 'package:flutter_localization/flutter_localization.dart';

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

  GetProfileImage() {
    if (FirebaseAuth.instance.currentUser?.photoURL == null) {
      return Image.network(
        FirebaseAuth.instance.currentUser!.photoURL!,
        height: 100,
        width: 100,
      );
    } else {
      return Icon(Icons.account_circle_rounded);
    }
  }

  Map<String, dynamic> d = {'hello': 1};
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dark Mode Switch'),
          elevation: 0,
        ),
        body: Center(
          child: Column(
            children: [
              FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('compt')
                      .doc('compt1')
                      .get(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      String name = snapshot.data!['username'];
                      return Text('$name');
                    } else {
                      return Text('no data');
                    }
                  }),
              ElevatedButton(
                  onPressed: (() => Firebase_db().Write_Data('water_tank', d)),
                  child: Text("send data")),
            ],
          ),
        ),
      ),
    );
  }
}
