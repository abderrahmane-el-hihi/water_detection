import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waterdetection/homepage.dart';
import 'package:waterdetection/serianumpage.dart';

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
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: FutureBuilder(
                future: MongodbConf.GetData("product"),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Text('loading'),
                    );
                  } else {
                    if (snapshot.hasData) {
                      var totaldata = snapshot.data.length;
                      if (snapshot.data.length == 0) {
                        return Text('connection set but there is no data');
                      }
                      print("total data" + totaldata.toString());
                      int quantite = snapshot.data![0]["quantite"];
                      print(quantite.toString());

                      return ListView.builder(
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
                                        'ceterne ${quantite}',
                                        style: TextStyle(
                                          color: Color.fromRGBO(0, 78, 131, 10),
                                        ),
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
                          });
                    } else {
                      return Center(
                        child: Text('no data'),
                      );
                    }
                  }
                  return Center(
                    child: Text('hdi rah return lakhira'),
                  );
                }),
            // child: Column(
            //   children: [
            //     // Container(

            //     //   padding: EdgeInsets.all(30),
            //     //   child: Column(
            //     //       crossAxisAlignment: CrossAxisAlignment.start,
            //     //       children: [
            //     //         Container(
            //     //           child: ListTile(
            //     //               title: Text(
            //     //                 'Products',
            //     //                 style: TextStyle(
            //     //                   color: Color.fromRGBO(0, 78, 131, 10),
            //     //                 ),
            //     //               ),
            //     //               leading: IconButton(
            //     //                 onPressed: Back,
            //     //                 icon: Icon(
            //     //                   Icons.arrow_back_rounded,
            //     //                   color: Color.fromRGBO(0, 78, 131, 10),
            //     //                 ),
            //     //               )),
            //     //         ),
            //     //       ]),
            //     // ),

            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}


/*  
SafeArea(
        child: 
      ),





 */





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