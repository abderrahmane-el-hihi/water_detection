import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:waterdetection/components/gnavbar.dart';
import 'package:waterdetection/settingspage.dart';

import 'components/graph_bar/graphbar.dart';
import 'homepage.dart';
import 'mongodb_config/mongo.dart';
import 'package:shimmer/shimmer.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  void ToSettings() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SettingsPage()));
  }

  void ToHome() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  List<double> SummaryWaterDb = [];

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
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            //size: 32,
            color: Color.fromRGBO(0, 78, 131, 10),
          ),
        ),
        title: Text(
          '${AppLocale.words[5].getString(context)}',
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
      bottomNavigationBar: GNavBar(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Center(
              child: FutureBuilder(
                  future: MongodbConf.GetData("historique"),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Shimmer(
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
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    }
                    return Text('error');
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
