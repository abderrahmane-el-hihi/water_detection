import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waterdetection/productmenupage.dart';

import 'components/icon_btn_state.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //signout method
  void SignOut() {
    FirebaseAuth.instance.signOut();
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
      //appBar: AppBar(title: Text('Stack')),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            //arrow icon
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductMenuPage()),
                    );
                  },
                  icon: Icon(Icons.arrow_back_rounded, size: 32)),
            ),
            //bonjour
            Positioned(
              top: 20,
              left: 70,
              child: Text(
                'Bonjour.',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            //calendar icon
            Positioned(
              top: 20,
              right: 60,
              child: Icon(
                Icons.calendar_month_rounded,
                size: 32,
              ),
            ),
            //notification icon
            Positioned(
              top: 20,
              right: 20,
              child: Icon(
                Icons.notifications_rounded,
                size: 32,
              ),
            ),
            //signout button
            Positioned(
              bottom: 10,
              right: 20,
              child: IconButton(
                onPressed: SignOut,
                icon: Icon(
                  Icons.logout,
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
                )),
            //toggle button
            ToggleButton(
              size: 100,
              //onToggle: (isDark) {if (MediaQuery.of(context).platformBrightness ==Brightness.light) {theme:ThemeData.dark();} else {theme:ThemeData.light();}},
            ),
          ],
        ),
      ),
    );
  }
}
