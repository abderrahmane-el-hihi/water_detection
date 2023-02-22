import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

class MongodbConf {
  static String mongodb_url =
      "mongodb+srv://root:root@WATER_DETECTION_DB.vdrc6kh.mongodb.net/waterdetection?retryWrites=true&w=majority";
  static String db_collection = "water_tank";
  static var db, collec;

  static Connect() async {
    db = await Db.create(mongodb_url);
    await db.open();
    inspect(db);
    collec = db.collection(db_collection);
  }

  static Future<List<Map<String, dynamic>>> GetData() async {
    final arrdata = await collec.find().toList();
    return arrdata;
  }
}
