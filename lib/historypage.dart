import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'components/chart.dart';
import 'homepage.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff232d37),
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
