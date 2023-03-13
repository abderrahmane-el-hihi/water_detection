import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:mongo_dart/mongo_dart.dart' show Db;

import 'components/graph_bar/graphbar.dart';
import "mongodb_config/mongo.dart";

class Test extends StatefulWidget {
  Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late Timer timer;
  late Map<String, dynamic> data = {
    'email': 'usertest@gmail.com',
    'password': 'user123',
    'username': 'usertest',
    'id_compt': 2
  };

  var document = {
    'email': 'John Doe',
    'password': 'john.doe@example.com',
  };
  void M() {
    Future<dynamic> Function() callback =
        MongodbConf.WriteDataToMongo("compt", data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 200,
          child: Column(
            children: [
              ElevatedButton.icon(
                onPressed: M,
                icon: Icon(Icons.abc_rounded),
                label: Text("send"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// use mongodb with flutter
/**
     * void Connection() async {
      var db = Db('mongodb://localhost:27017/mydb');
      await db.open();

      var collection = db.collection('myCollection');

      var document = {'fieldName': 'fieldValue'};
      await collection.insert(document);

      var result = await collection.find().toList();
      print(result);

      await db.close();
    }
     */

//var data = '';

// Future<void> connect() async {
//   var db = Db('mongodb://localhost:27017/water_detection');
//   await db.open();
//   var collection = db.collection('water_tank');
//   var result = await collection.findOne();
//   setState(() {
//     data = result.toString();
//   });
//   db.close();
// }

// @override
// void initState() {
//   super.initState();
//   connect();
// }

// FutureBuilder(
//             future: MongodbConf.GetData(),
//             builder: (context, AsyncSnapshot snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(
//                   child: Text('loading'),
//                 );
//               } else {
//                 if (snapshot.hasData) {
//                   var totaldata = snapshot.data.length;
//                   if (snapshot.data.length == 0) {
//                     return Text('connection set but there is no data');
//                   }
//                   print("total data" + totaldata.toString());
//                   //return Text("${snapshot.data}");
//                   int p = snapshot.data![0]["percentage"];
//                   return Text("${p / 100}");
//                 } else {
//                   return Center(
//                     child: Text('no data'),
//                   );
//                 }
//               }
//               return Center(
//                 child: Text('hdi rah return lakhira'),
//               );
//             }),
