import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:waterdetection/components/l_button.dart';
import 'package:waterdetection/homepage.dart';
import 'package:waterdetection/productmenupage.dart';

import 'components/text_field.dart';

class SerialPage extends StatelessWidget {
  SerialPage({super.key});
  //serial naumver controller
  final serialcontroller = TextEditingController();
  //submit method
  void Submit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /*Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(217, 217, 217, 1),
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(100, 100)),
                        )),*/
                    Icon(
                      Icons.account_circle,
                      size: 128,
                      color: Color.fromRGBO(217, 217, 217, 1),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text('User Name'),
                    SizedBox(
                      height: 50,
                    ),
                    Text_Field(
                      controller: serialcontroller,
                      hinText: 'Serial Number',
                      obsecureText: false,
                      preicon: Icons.qr_code_scanner_rounded,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    L_Button(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductMenuPage()),
                          );
                        },
                        text: 'Submit')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
