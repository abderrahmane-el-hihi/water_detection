import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:waterdetection/components/chartv2.dart';

//mongodb
import 'package:mongo_dart/mongo_dart.dart';

class Test extends StatelessWidget {
  Test({super.key});

  //final Stream<QuerySnapshot> users =FirebaseFirestore.instance.collection('test').snapshots();

  // connect flutter to mongodb

  // void Connect() async {
  //   var db = Db('mongodb://localhost:27017/water_detection');
  //   await db.open();
  //   var collection = db.collection('water_detection');
  //   var client = {'name': 'c1', 'id': '1'};
  //   await collection.insert(client);
  //   var result = await collection.find().toList();
  //   print(result);
  //   await db.close();
  // }

  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
      body: SafeArea(
        child: Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: users,
            builder: (
              BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot,
            ) {
              if (snapshot.hasError) {
                return Text('something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('loading...');
              }
              final data = snapshot.requireData;
              return ListView.builder(
                itemCount: data.size,
                itemBuilder: ((context, index) {
                  return Text(
                      'name : ${data.docs[index]['name']}, nickname: ${data.docs[index]['nickname']}');
                }),
              );
            },
          ),
        ),
      ),
    );*/

    /*StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Water-Wetection')
          .doc('Compte')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.exists) {
          return Scaffold(
              body: Center(child: Text(snapshot.data!['PassWord'].toString())));
        } else if (snapshot.hasError) {
          return Scaffold(
              body: Center(child: Text("Error: ${snapshot.error}")));
        } else {
          return Scaffold(
            body: Text("${snapshot.data?.data()}"),
          );
        }
      },
    );*/

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: (() => {}),
                  //Connect,
                  child: Text(
                    'insert doc to mongodb successfully',
                  )),
            ],
          ),
        ),
      ),
    );

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
  }
}
