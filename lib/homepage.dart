import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waterdetection/productmenupage.dart';
import 'package:waterdetection/settingspage.dart';

import 'components/chart.dart';
import 'components/icon_btn_state.dart';
import 'historypage.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

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
        //backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductMenuPage()),
            );
          },
          icon: Icon(Icons.arrow_back_rounded,
              //size: 32,
              color: Color.fromARGB(255, 255, 255, 255)),
        ),
        title: Text('Bonjour.'),
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
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          IconButton(
            onPressed: (() {}),
            icon: Icon(
              Icons.notifications_rounded,
              //size: 32,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 187, 187, 187),
                  /*boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(3, 3),
                        blurRadius: 3.0,
                        spreadRadius: 0.5)
                  ],*/
                ),
                width: 350,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //home icon
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.home_rounded,
                            size: 32,
                            color: Colors.black,
                          )),
                    ),
                    //settings button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: IconButton(
                        onPressed: (() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsPage()),
                          );
                        }),
                        icon: Icon(
                          Icons.settings_rounded,
                          size: 32,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              /*Image(
                image: AssetImage('assets/google.png'),
                height: 24,
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
