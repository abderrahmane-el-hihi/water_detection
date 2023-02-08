import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:waterdetection/settingspage.dart';

import 'components/chart.dart';
import 'components/chartv2.dart';
import 'homepage.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff232d37),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: GestureDetector(onTap: ToHome, child: Icon(Icons.home_rounded)),
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
            Row(
              children: [
                IconButton(
                    onPressed: (() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }),
                    icon: Icon(Icons.arrow_back_rounded)),
                Text('History'),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Center(
              child: Chart(),
            ),
            SizedBox(
              height: 50,
            ),
            Text('chateau 3ndek wak7 a m3alam'),
          ],
        ),
      ),
    );
  }
}
