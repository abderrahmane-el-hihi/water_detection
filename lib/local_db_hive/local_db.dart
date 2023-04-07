// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class Local_Db {
//   late Box myBox;
//   Future Create_loca_db() async {
//     myBox = await Hive.openBox('myBox');
//   }

//   Map<String, dynamic> compt = {
//     'email': '',
//     'password': '',
//     'username': '',
//     'id_compt': ''
//   };
//   Future add_data() {
//     return myBox.add(compt);
//   }

//   Future Get_data() async {
//     Map<String, dynamic> myData = myBox.get(0);
//   }

//   Future Update_db() async {
//     Map<String, dynamic> compt = {
//       'email': '',
//       'password': '',
//       'username': '',
//       'id_compt': ''
//     };
//     myBox.put(0, compt);
//   }

//   Future Delete_data() async {
//     myBox.delete(0);
//   }
// }
