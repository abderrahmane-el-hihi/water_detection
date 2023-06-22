import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:percent_indicator/percent_indicator.dart';
//import 'package:shimmer/shimmer.dart';
import 'package:waterdetection/components/graph_bar/graphbar.dart';
//import 'package:waterdetection/Firebasedb_config/firebase_db.dart';
import 'package:waterdetection/productmenupage.dart';
import 'package:waterdetection/settingspage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
//import 'package:percent_indicator/circular_percent_indicator.dart';
//import 'components/gnavbar.dart';
//import 'components/icon_btn_state.dart';
import 'historypage.dart';
//import 'package:mongo_dart/mongo_dart.dart' show Db;
import 'services/connect_to_arduino.dart';
import 'services/local_notif_service.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Timer timer;
  List<Map<String, dynamic>> Data = [];
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late String message = '';

  //connect with local py server
  // int receivedNumber = 0;
  // late connect_to_server numberReceiver;

  // void connect() {
  //   numberReceiver.connectToServer((number){
  //     setState(() {
  //       // receivedNumber = number;
  //       //SummaryWaterDb.removeAt(0);
  //       //SummaryWaterDb.add(number);
  //     });
  //   });
  // }
  //

  @override
  void initState() {
    super.initState();
    Notif.initialize(flutterLocalNotificationsPlugin);
    // timer = Timer.periodic(Duration(seconds: 900), (Timer t) => getData());
    // numberReceiver = connect_to_server('192.168.11.162', 35080);
    // connect();
  }

  void ToSettings() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SettingsPage()));
  }

  List SummaryWaterDb = [];
  List<Map<String, dynamic>> l = [];

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void OnRefresh() async {
    // await FirebaseFirestore.instance
    //     .collection('water_tank')
    //     .doc('tank1')
    //     .get();

    refreshController.refreshCompleted();
  }

  // bool t() {
  //   if (receivedNumber < 20) {
  //     // Notif.showBigTextNotification(
  //     //     title: "Water detection",
  //     //     body: "alert water level",
  //     //     fln: flutterLocalNotificationsPlugin);
  //     // message = 'your water tank percentage is about $receivedNumber%';
  //     return true;
  //   }
  //   return false;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductMenuPage()),
            );
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Color.fromRGBO(0, 78, 131, 10),
          ),
        ),
        title: Text(
          '${AppLocale.words[9].getString(context)}',
          style: TextStyle(
              color: Color.fromRGBO(0, 78, 131, 10), fontFamily: "Poppins"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsPage()),
              );
            },
            icon: Icon(
              Icons.calendar_month_rounded,
              color: Color.fromRGBO(0, 78, 131, 10),
            ),
          ),
        ],
      ),
      body: SmartRefresher(
        controller: refreshController,
        onRefresh: OnRefresh,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),

              FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('water_tank')
                      .doc('tank1')
                      .get(),

                  // .where('detector_ref', isEqualTo: '/detector/detector1')
                  // .get(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Color.fromRGBO(0, 78, 131, 10),
                        ),
                      );
                    } else {
                      if (snapshot.hasData) {
                        int p = snapshot.data!["percentage"];
                        print(p);
                        if (p <= 20) {
                          // Notif.showBigTextNotification(
                          //     title: "Water detection",
                          //     body: "alert water level",
                          //     fln: flutterLocalNotificationsPlugin);
                          // message = 'your water tank percentage is about $p%';
                        }
                        bool t() {
                          if (p < 20) {
                            return true;
                          }
                          return false;
                        }

                        return SingleChildScrollView(
                          child: Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Row(
                                    children: [
                                      Text(
                                        '${AppLocale.words[10].getString(context)} :',
                                        style: TextStyle(
                                            fontSize: 24,
                                            color:
                                                Color.fromRGBO(0, 78, 131, 10),
                                            fontFamily: "Poppins"),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  height: 150.0,
                                  width: 150.0,
                                  child: CircularPercentIndicator(
                                    radius: 70.0,
                                    lineWidth: 15.0,
                                    percent: p / 100,
                                    center: Text(
                                      "${p}%",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 170, 170, 170),
                                          fontSize: 20),
                                    ),
                                    progressColor: t()
                                        ? Color.fromARGB(144, 255, 57, 57)
                                        : Color.fromRGBO(0, 78, 131, 10),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                            '${AppLocale.words[11].getString(context)} :',
                                            style: TextStyle(
                                                fontSize: 24,
                                                color: Color.fromRGBO(
                                                    0, 78, 131, 10),
                                                fontFamily: "Poppins")),
                                      ]),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: Text('no data'),
                        );
                      }
                    }
                  }),
              FutureBuilder(
                  future:
                      FirebaseFirestore.instance.collection('history').get(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                            color: Color.fromRGBO(0, 78, 131, 10)),
                      );
                    } else if (snapshot.hasData) {
                      SummaryWaterDb.clear();
                      List<QueryDocumentSnapshot<Map<String, dynamic>>>
                          documents = snapshot.data!.docs;
                      for (var i = 0; i < snapshot.data!.size; i++) {
                        SummaryWaterDb.add(
                            documents[i].data()['available_capa']);
                      }
                      print(SummaryWaterDb);
                      return Column(
                        children: [
                          Center(
                            child: SizedBox(
                              height: 200,
                              child: GraphBar(
                                SummaryWater: SummaryWaterDb,
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return Text('error');
                  }),

              // SizedBox(
              //   height: 50,
              // ),
              // CircularPercentIndicator(
              //   radius: 100.0,
              //   lineWidth: 15.0,
              //   percent: receivedNumber / 100,
              //   center: Text(
              //     "${receivedNumber}%",
              //     style: TextStyle(
              //         color: Color.fromARGB(255, 170, 170, 170), fontSize: 20),
              //   ),
              //   progressColor: t()
              //       ? Color.fromARGB(144, 255, 57, 57)
              //       : Color.fromRGBO(0, 78, 131, 10),
              // ),
              // SizedBox(
              //   height: 50,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// CircularPercentIndicator(
//   radius: 300,
//   lineWidth: 20,
//   progressColor: Color.fromRGBO(0, 78, 131, 10),
//   backgroundColor: Color.fromARGB(255, 189, 189, 189),
//   circularStrokeCap: CircularStrokeCap.round,
//   percent: 0.7,
//   center: Text(
//     '70%',
//     style: TextStyle(
//       fontSize: 50,
//       color: Color.fromRGBO(0, 78, 131, 10),
//     ),
//   ),
// ),

//----------------read dat from water_tank collection in firebase

// 

//----------------read dat from history collection in firebase

// FutureBuilder(
//                   future:
//                       FirebaseFirestore.instance.collection('history').get(),
//                   builder: (context,
//                       AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
//                           snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return Center(
//                         child: CircularProgressIndicator(
//                             color: Color.fromRGBO(0, 78, 131, 10)),
//                       );
//                     } else if (snapshot.hasData) {
//                       SummaryWaterDb.clear();
//                       List<QueryDocumentSnapshot<Map<String, dynamic>>>
//                           documents = snapshot.data!.docs;
//                       for (var i = 0; i < snapshot.data!.size; i++) {
//                         SummaryWaterDb.add(
//                             documents[i].data()['available_capa']);
//                       }
//                       print(SummaryWaterDb);
//                       return Column(
//                         children: [
//                           Center(
//                             child: SizedBox(
//                               height: 200,
//                               child: GraphBar(
//                                 SummaryWater: SummaryWaterDb,
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                     }
//                     return Text('error');
//                   }),
