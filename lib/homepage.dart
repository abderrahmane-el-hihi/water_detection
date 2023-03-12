import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:waterdetection/components/graph_bar/graphbar.dart';
import 'package:waterdetection/productmenupage.dart';
import 'package:waterdetection/settingspage.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'components/icon_btn_state.dart';
import 'historypage.dart';
import 'package:mongo_dart/mongo_dart.dart' show Db;

import 'mongodb_config/mongo.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Timer timer;
  List<Map<String, dynamic>> Data = [];

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(seconds: 900), (Timer t) => getData());
  }

  Future<void> getData() async {
    final data = await MongodbConf.GetData("water_tank");

    setState(() {
      Data = data;
    });
  }

  final C = true;

  void ToSettings() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SettingsPage()));
  }

  List<double> SummaryWaterDb = [];
  List<Map<String, dynamic>> l = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductMenuPage()),
            );
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            //size: 32,
            color: Color.fromRGBO(0, 78, 131, 10),
          ),
        ),
        title: Text(
          'Bonjour.',
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
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        //color: Colors.black,
                      ),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text('Notifications'),
                          Divider(
                            color: Color.fromARGB(255, 222, 228, 226),
                            thickness: 1,
                          ),
                        ],
                      ),
                    );
                  });
            },
            icon: Icon(
              Icons.notifications_rounded,
              color: Color.fromRGBO(0, 78, 131, 10),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
              onTap: ToSettings, child: Icon(Icons.settings_rounded)),
          label: 'Setings',
          activeIcon: Icon(Icons.settings_rounded),
        ),
      ]),
      body: SafeArea(
        child: Column(
          children: [
            FutureBuilder(
                future: MongodbConf.GetData("water_tank"),
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
                          style:
                              TextStyle(fontSize: 40.0, fontFamily: "Poppins"),
                        ),
                      ),
                    );
                  } else {
                    if (snapshot.hasData) {
                      var totaldata = snapshot.data.length;
                      if (snapshot.data.length == 0) {
                        return Text('connection set but there is no data');
                      }
                      print("total data" + totaldata.toString());
                      //return Text("${snapshot.data}");
                      int p = snapshot.data![0]["percentage"];
                      l.clear();
                      for (var i = 0; i < snapshot.data.length; i++) {
                        l.add(snapshot.data![0]);
                      }
                      print(l.toString());

                      return SingleChildScrollView(
                        child: Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                'actual percentage :',
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Color.fromRGBO(0, 78, 131, 10),
                                    fontFamily: "Poppins"),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                height: 150.0,
                                width: 150.0,
                                child: LiquidCustomProgressIndicator(
                                  value: p / 100,
                                  valueColor: AlwaysStoppedAnimation(
                                    C
                                        ? Color.fromARGB(144, 155, 173, 219)
                                        : Color.fromARGB(144, 255, 57, 57),
                                  ),
                                  backgroundColor:
                                      Color.fromRGBO(212, 224, 255, 0.565),
                                  direction: Axis.vertical,
                                  shapePath: CylinderPath(),
                                  center: Text(
                                    "${p}%",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 170, 170, 170),
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Details :',
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
                future: MongodbConf.GetData("historique"),
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
                          style: TextStyle(fontSize: 40.0),
                        ),
                      ),
                    );
                  } else if (snapshot.hasData) {
                    SummaryWaterDb.clear();
                    for (var i = 0; i < snapshot.data.length; i++) {
                      SummaryWaterDb.add(snapshot.data![i]["available_capa"]);
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
    );
  }
}

//path type for LiquidCustomProgressIndicator shapepath parameter
Path CylinderPath() {
  final Path path = Path();
  path.moveTo(20, 0);
  path.lineTo(20, 100);
  path.arcToPoint(
    Offset(130, 100),
    radius: Radius.circular(20.0),
    clockwise: false,
  );
  path.lineTo(130, 0);
  path.arcToPoint(
    Offset(20, 0),
    radius: Radius.circular(20.0),
    clockwise: false,
  );
  return path;
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