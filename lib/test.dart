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

  @override
  void initState() {
    super.initState();
    Notif.initialize(flutterLocalNotificationsPlugin);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 600,
          child: Column(
            children: [
              Text_Field(
                  controller: emailcontroller,
                  hinText: 'email',
                  obsecureText: false,
                  preicon: Icons.cloud),
              Text_Field(
                  controller: passcontroller,
                  hinText: 'password',
                  obsecureText: false,
                  preicon: Icons.cloud),
              Text_Field(
                  controller: usernamecontroller,
                  hinText: 'username',
                  obsecureText: false,
                  preicon: Icons.cloud),
              Text_Field(
                  controller: idcontroller,
                  hinText: 'id',
                  obsecureText: false,
                  preicon: Icons.cloud),
              ElevatedButton.icon(
                onPressed: () => MongodbConf.WriteDataToMongo("compt", data),
                icon: Icon(Icons.cloud),
                label: Text("send"),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Notif.showBigTextNotification(
                      title: "test notification",
                      body: "sir 3amer  chateau t9awed",
                      fln: flutterLocalNotificationsPlugin);
                },
                icon: Icon(Icons.cloud),
                label: Text("notification"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
