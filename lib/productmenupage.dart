import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:shimmer/shimmer.dart';
import 'package:waterdetection/components/gnavbar.dart';
import 'package:waterdetection/home2page.dart';
import 'package:waterdetection/homepage.dart';
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

  Future<void> getData() async {
    final data = await MongodbConf.GetData("product");

    setState(() {
      Data = data;
    });
  }

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
                future: MongodbConf.GetData("product"),
                //future: FirebaseFirestore.instance.collection('products').get(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Shimmer(
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey.shade200,
                            Color.fromARGB(255, 143, 143, 143),
                            Colors.grey.shade200,
                          ],
                          stops: [
                            0.0,
                            0.5,
                            1.0,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        child: Text(
                          'Loading',
                          style: TextStyle(fontFamily: "Poppins"),
                        ),
                      ),
                    );
                  } else {
                    if (snapshot.hasData) {
                      var totaldata = snapshot.data.length;
                      if (snapshot.data.length == 0) {
                        return Text('connection set but there is no data');
                      }

                      int quantite = snapshot.data![0]["quantite"];

                      return Expanded(
                        child: ListView.builder(
                            itemCount: quantite,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Container(
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