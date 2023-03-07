import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

class MongodbConf {
  static String mongodb_url =
      "mongodb+srv://root:root@WATER_DETECTION_DB.vdrc6kh.mongodb.net/waterdetection?retryWrites=true&w=majority";
  //static String db_collection = "water_tank";

  //static String db_collection = "product";

  static var db, collec;
  // static var document = {
  //   'email': 'John Doe',
  //   'password': 'john.doe@example.com',
  // };

  static Connect() async {
    db = await Db.create(mongodb_url);
    await db.open();
    inspect(db);
  }

  static Future<List<Map<String, dynamic>>> GetData(
      String db_collection) async {
    collec = db.collection(db_collection);
    final arrdata = await collec.find().toList();
    return arrdata;
  }

  // InsertData(document) async {
  //   final result = await collec.insert(document);
  // }
  // static Future<void> Insert() async {
  //   try {
  //     var result = await collec.insertOne(document);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
