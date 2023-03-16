import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

class MongodbConf {
  static String mongodb_url =
      "mongodb+srv://root:root@WATER_DETECTION_DB.vdrc6kh.mongodb.net/waterdetection?retryWrites=true&w=majority";

  static var db, collec;

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

  static WriteDataToMongo(
      String collectionName, Map<String, dynamic> data) async {
    final collection = db.collection(collectionName);
    await collection.insertOne(data);
  }
}
