import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:waterdetection/components/chartv2.dart';

//mongodb
import 'package:mongo_dart/mongo_dart.dart' show Db;

import 'mongodb_config/mongo.dart';

class Test extends StatefulWidget {
  Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late Timer timer;
  List<Map<String, dynamic>> Data = [];

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => getData());
  }

  Future<void> getData() async {
    final data = await MongodbConf.GetData("compt");

    setState(() {
      Data = data;
    });
  }

  Future<dynamic> InsertData(document) async {
    //await MongodbConf.Insert();
  }

  var document = {
    'email': 'John Doe',
    'password': 'john.doe@example.com',
  };

  //final result = await collection.insert(document);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Center(
        child: Text(Data.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          InsertData(document);
        },
        tooltip: 'insert to MongoDB',
        child: Icon(Icons.cloud),
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