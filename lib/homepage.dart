import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:waterdetection/productmenupage.dart';
import 'package:waterdetection/settingspage.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'components/chart.dart';
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
  void ToSettings() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SettingsPage()));
  }

  @override
  Widget build(BuildContext context) {
    /*
      return Scaffold(
      /*appBar: AppBar(
        actions: [
          IconButton(onPressed: SignOut, icon: Icon(Icons.logout)),
          Row(
            //mainAxisAlignment: MainAxisAlignment.start,

            children: [
              IconButton(
                  onPressed: PageBack, icon: Icon(Icons.arrow_back_rounded))
            ],
          ),
        ],
      ),*/
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              //SizedBox(height: 32,),
              //Icon(Icons.search_rounded,size: 32,),
              //Icon(Icons.menu_rounded,size: 32,),
              //Image.asset('images/codrops.png'),
            ],
          ),
        ),
      ),
    );
     */

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
            color: Color.fromRGBO(0, 78, 131, 10),
          ),
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
        child: FutureBuilder(
            future: MongodbConf.GetData(),
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
                  //return Text("${snapshot.data}");
                  int p = snapshot.data![0]["percentage"];

                  //return Text("${p / 100}");
                  return SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Text(
                            'actual percentage :',
                            style: TextStyle(
                              fontSize: 30,
                              color: Color.fromRGBO(0, 78, 131, 10),
                            ),
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
                                  Color.fromARGB(144, 155, 173, 219)),
                              backgroundColor:
                                  Color.fromRGBO(212, 224, 255, 0.565),
                              direction: Axis.vertical,
                              shapePath: CylinderPath(),
                              center: Text(
                                "${p}%",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Details :',
                            style: TextStyle(
                              fontSize: 50,
                              color: Color.fromRGBO(0, 78, 131, 10),
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          //Chart(),
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
              return Center(
                child: Text('hdi rah return lakhira'),
              );
            }),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: Connect,
      //   tooltip: 'Connect to MongoDB',
      //   child: Icon(Icons.cloud),
      // ),
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