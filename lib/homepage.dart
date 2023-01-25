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
      //appBar: AppBar(title: Text('Stack')),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            //Material(color: Color(0xff232d37)),
            //arrow icon
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductMenuPage()),
                  );
                },
                icon: Icon(Icons.arrow_back_rounded,
                    size: 32, color: Colors.black),
              ),
            ),
            //bonjour
            Positioned(
              top: 20,
              left: 70,
              child: Text(
                'Bonjour.',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            //calendar icon
            Positioned(
              top: 10,
              right: 60,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailsPage()),
                  );
                },
                icon: Icon(
                  Icons.calendar_month_rounded,
                  size: 32,
                  color: Colors.black,
                ),
              ),
            ),
            //notification icon
            Positioned(
              top: 20,
              right: 20,
              child: Icon(
                Icons.notifications_rounded,
                size: 32,
                color: Colors.black,
              ),
            ),

            Positioned(
              bottom: 10,
              right: 20,
              child: IconButton(
                onPressed: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                }),
                icon: Icon(
                  Icons.settings_rounded,
                  size: 32,
                ),
              ),
            ),
            //home icon
            Positioned(
                bottom: 10,
                left: 20,
                child: Icon(
                  Icons.home_rounded,
                  size: 32,
                  color: Colors.black,
                )),
            //toggle button
            Positioned(
              top: 20,
              left: 200,
              child: ToggleButton(
                size: 32,
                color: Colors.black,
                //onToggle: (isDark) {if (MediaQuery.of(context).platformBrightness ==Brightness.light) {theme:ThemeData.dark();} else {theme:ThemeData.light();}},
              ),
            ),
            //Chart(),
          ],
        ),
      ),
    );
  }
}
