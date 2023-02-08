import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waterdetection/productmenupage.dart';
import 'package:waterdetection/settingspage.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'components/chart.dart';
import 'components/icon_btn_state.dart';
import 'historypage.dart';

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
              //size: 32,
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
              //size: 32,
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
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                /*StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Water-Detection')
                      .doc('Water-Tank')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      //var progress = snapshot.data;
                      var progress = snapshot.data!.data();
                      //var progress = snapshot.data!['percentage'].toString();
                      //var progress = snapshot.data!['percentage'];
                      //var progress = snapshot.data?.data(/*'percentage'*/);
                      //DocumentSnapshot<Map<String, dynamic>>? progress =snapshot.data;
                      return CircularPercentIndicator(
                        radius: 300,
                        lineWidth: 20,
                        progressColor: Color.fromRGBO(0, 78, 131, 10),
                        backgroundColor: Color.fromARGB(255, 189, 189, 189),
                        circularStrokeCap: CircularStrokeCap.round,
                        percent: 0.7,
                        center: Text(
                          '$progress',
                          style: TextStyle(
                            fontSize: 10,
                            color: Color.fromRGBO(0, 78, 131, 10),
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    }
                    //else if (snapshot.data!.data()!.containsKey('percentage')) {return Text('rah makayn');
                    else {
                      return Text('no data');
                    }
                  },
                ),*/

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
                CircularPercentIndicator(
                  radius: 300,
                  lineWidth: 20,
                  progressColor: Color.fromRGBO(0, 78, 131, 10),
                  backgroundColor: Color.fromARGB(255, 189, 189, 189),
                  circularStrokeCap: CircularStrokeCap.round,
                  percent: 0.7,
                  center: Text(
                    '70%',
                    style: TextStyle(
                      fontSize: 50,
                      color: Color.fromRGBO(0, 78, 131, 10),
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
                Chart(),
                //Image.asset('assets/iamges/google.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
