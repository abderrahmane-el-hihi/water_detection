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

  @override
  void initState() {
    super.initState();
    Notif.initialize(flutterLocalNotificationsPlugin);
    // timer = Timer.periodic(Duration(seconds: 900), (Timer t) => getData());
    addNotification(message);
  }

  void ToSettings() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SettingsPage()));
  }

  List<String> notifications = []; // List to store notifications

  // Method to add a notification to the list and schedule a local notification
  Future<void> addNotification(String notification) async {
    setState(() {
      notifications.add(notification);
    });
  }

  // Method to remove a notification from the list
  void removeNotification(String notification) {
    setState(() {
      notifications.remove(notification);
    });
  }

  Future<void> onSelectNotification(String? payload) async {
    // Handle notification tap event here
    print('Notification tapped: $payload');
  }

  List SummaryWaterDb = [];
  List<Map<String, dynamic>> l = [];

  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  void OnRefresh() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('water_tank')
        .doc('tank1')
        .get();

    setState(() {
      int p = snapshot.data() as int;
    });
    refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        //backgroundColor: Colors.white,
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
          IconButton(
            onPressed: () {
              // showModalBottomSheet(
              //   context: context,
              //   builder: (BuildContext context) {
              //     return Container(
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       padding: EdgeInsets.all(10),
              //       child: Column(
              //         children: <Widget>[
              //           Text('${AppLocale.words[3].getString(context)}'),
              //           Divider(
              //             color: Color.fromARGB(255, 222, 228, 226),
              //             thickness: 1,
              //           ),
              //           Expanded(
              //             child: ListView.builder(
              //               itemCount: notifications.length,
              //               itemBuilder: (BuildContext context, int index) {
              //                 return ListTile(
              //                   title: Text(notifications[index]),
              //                   trailing: IconButton(
              //                     icon: Icon(Icons.delete),
              //                     onPressed: () {
              //                       // Remove notification when delete button is pressed
              //                       removeNotification(notifications[index]);
              //                     },
              //                   ),
              //                 );
              //               },
              //             ),
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              // );
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 200,
                    child: Column(
                      children: [
                        Text('Notifications'),
                        Divider(
                          color: Color.fromARGB(255, 222, 228, 226),
                          thickness: 1,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: notifications.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Text(notifications[index]),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    // Delete the notification.
                                    setState(() {
                                      notifications.removeAt(index);
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: Icon(
              Icons.notifications_rounded,
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
            children: [
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
                        //child: Text('Loading',style: TextStyle(fontSize: 40.0, fontFamily: "Poppins"),),
                        child: CircularProgressIndicator(
                          color: Color.fromRGBO(0, 78, 131, 10),
                        ),
                      );
                    } else {
                      if (snapshot.hasData) {
                        int p = snapshot.data!["percentage"];

                        print(p);
                        if (p <= 20) {
                          Notif.showBigTextNotification(
                              title: "Water detection",
                              body: "your water tank percentage is about $p%",
                              fln: flutterLocalNotificationsPlugin);
                          message = 'your water tank percentage is about $p%';
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
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${AppLocale.words[10].getString(context)} :',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Color.fromRGBO(0, 78, 131, 10),
                                      fontFamily: "Poppins"),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  height: 150.0,
                                  width: 150.0,
                                  //lequid custom progress form home page
                                  // child: LiquidCustomProgressIndicator(
                                  //   value: p / 100,
                                  //   valueColor: AlwaysStoppedAnimation(
                                  //     C
                                  //         ? Color.fromARGB(144, 155, 173, 219)
                                  //         : Color.fromARGB(144, 255, 57, 57),
                                  //   ),
                                  //   backgroundColor:
                                  //       Color.fromRGBO(212, 224, 255, 0.565),
                                  //   direction: Axis.vertical,
                                  //   shapePath: CylinderPath(),
                                  //   center: Text(
                                  //     "${p}%",
                                  //     style: TextStyle(
                                  //         color:
                                  //             Color.fromARGB(255, 170, 170, 170),
                                  //         fontSize: 20),
                                  //   ),
                                  // ),
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
                                Text(
                                  '${AppLocale.words[11].getString(context)} :',
                                  style: TextStyle(
                                      fontSize: 50,
                                      color: Color.fromRGBO(0, 78, 131, 10),
                                      fontFamily: "Poppins"),
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
                  //future: Firebase_db().Get_data_2Collection_firestore('history'),
                  future:
                      FirebaseFirestore.instance.collection('history').get(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                            color: Color.fromRGBO(0, 78, 131, 10)),
                        //child: Text('Loading',style: TextStyle(fontSize: 40.0),),
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
            ],
          ),
        ),
      ),
    );
  }
}

//path type for LiquidCustomProgressIndicator shapepath parameter
// Path CylinderPath() {
//   final Path path = Path();
//   path.moveTo(20, 0);
//   path.lineTo(20, 100);
//   path.arcToPoint(
//     Offset(130, 100),
//     radius: Radius.circular(20.0),
//     clockwise: false,
//   );
//   path.lineTo(130, 0);
//   path.arcToPoint(
//     Offset(20, 0),
//     radius: Radius.circular(20.0),
//     clockwise: false,
//   );
//   return path;
// }

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
