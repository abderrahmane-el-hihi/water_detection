import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:shimmer/shimmer.dart';
import 'package:waterdetection/components/gnavbar.dart';
import 'package:waterdetection/home2page.dart';
import 'package:waterdetection/homepage.dart';
import 'package:waterdetection/mongodb_config/firebase_db.dart';
import 'package:waterdetection/serianumpage.dart';
import 'package:waterdetection/settingspage.dart';

import 'mongodb_config/mongo.dart';

class ProductMenuPage extends StatefulWidget {
  ProductMenuPage({super.key});

  @override
  State<ProductMenuPage> createState() => _ProductMenuPageState();
}

class _ProductMenuPageState extends State<ProductMenuPage> {
  void Back() {
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => SerialPage())));
  }

  List<Map<String, dynamic>> Data = [];

  void ToHome() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SwitchPages()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SerialPage()),
            );
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Color.fromRGBO(0, 78, 131, 10),
          ),
        ),
        title: Text(
          '${AppLocale.words[12].getString(context)}',
          style: TextStyle(
              color: Color.fromRGBO(0, 78, 131, 10), fontFamily: "Poppins"),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            FutureBuilder(
                // future: MongodbConf.GetData("product"),
                // future: Firebase_db().Get_data_Collection_firestore('detector'),
                future: FirebaseFirestore.instance.collection('detector').get(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasData) {
                      int quantite = snapshot.data.size as int;
                      return Expanded(
                        child: ListView.builder(
                            itemCount: quantite,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      border: Border.all(
                                        color: Color.fromRGBO(0, 78, 131, 10),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: ListTile(
                                        onTap: ToHome,
                                        title: Text(
                                          'ceterne ${index + 1}',
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  0, 78, 131, 10),
                                              fontFamily: "Poppins"),
                                        ),
                                        leading: Icon(
                                          Icons.abc,
                                          color: Color.fromRGBO(0, 78, 131, 10),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              );
                            }),
                      );
                    } else {
                      return Center(
                        child: Text('no data'),
                      );
                    }
                  }
                }),
          ],
        ),
      ),
    );
  }
}








// SingleChildScrollView(
//             child: Container(
//               padding: EdgeInsets.all(30),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     child: ListTile(
//                         title: Text(
//                           'Products',
//                           style: TextStyle(
//                             color: Color.fromRGBO(0, 78, 131, 10),
//                           ),
//                         ),
//                         leading: IconButton(
//                           onPressed: Back,
//                           icon: Icon(
//                             Icons.arrow_back_rounded,
//                             color: Color.fromRGBO(0, 78, 131, 10),
//                           ),
//                         )),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Color.fromARGB(255, 255, 255, 255),
//                       border: Border.all(
//                         color: Color.fromRGBO(0, 78, 131, 10),
//                         width: 1,
//                       ),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: ListTile(
//                         onTap: ToHome,
//                         title: Text(
//                           'ceterne ',
//                           style: TextStyle(
//                             color: Color.fromRGBO(0, 78, 131, 10),
//                           ),
//                         ),
//                         leading: Icon(
//                           Icons.abc,
//                           color: Color.fromRGBO(0, 78, 131, 10),
//                         )),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Color.fromARGB(255, 255, 255, 255),
//                       border: Border.all(
//                         color: Color.fromRGBO(0, 78, 131, 10),
//                         width: 1,
//                       ),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: ListTile(
//                         onTap: ToHome,
//                         title: Text(
//                           'ceterne ',
//                           style: TextStyle(
//                             color: Color.fromRGBO(0, 78, 131, 10),
//                           ),
//                         ),
//                         leading: Icon(
//                           Icons.abc,
//                           color: Color.fromRGBO(0, 78, 131, 10),
//                         )),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Color.fromARGB(255, 255, 255, 255),
//                       border: Border.all(
//                         color: Color.fromRGBO(0, 78, 131, 10),
//                         width: 1,
//                       ),
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: ListTile(
//                         onTap: ToHome,
//                         title: Text(
//                           'ceterne ',
//                           style: TextStyle(
//                             color: Color.fromRGBO(0, 78, 131, 10),
//                           ),
//                         ),
//                         leading: Icon(
//                           Icons.abc,
//                           color: Color.fromRGBO(0, 78, 131, 10),
//                         )),
//                   ),
//                 ],
//               ),
//             ),
//           ),