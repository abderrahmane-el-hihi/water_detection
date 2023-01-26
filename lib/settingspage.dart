import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:google_fonts/google_fonts.dart';

import 'package:waterdetection/homepage.dart';

import 'components/icon_btn_state.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  //bool isdark initialazed on false
  bool isDark = false;
  //signout method
  void SignOut() {
    FirebaseAuth.instance.signOut();
  }

  //go to web site method
  void GoToSite() async {
    const url = 'googlechrome:https://www.google.com';
    /*
       if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
     */
  }

  //ToDArk
  void ToDark() {
    //SwicthTheme
    setState(() {
      isDark = !isDark;
    });
  }

  //control push notifications method
  void Notifications() {
    //using loflutter_local_notif package

    //if toggle btn on

    //if toggle btn off
  }

  void Fingerprint() {
    //using local_auth package
    //if biometrics on
    //if biometrics off
  }

  void SelectLang() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: [
              ListTile(
                //contentPadding: EdgeInsets.only(left: 170),
                title: Container(child: Center(child: Text('Arabic'))),
                onTap: () => {},
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Divider(
                      color: Color.fromRGBO(179, 179, 179, 1), thickness: 1)),
              ListTile(
                title: Container(child: Center(child: Text('French'))),
                onTap: () => {},
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: Divider(
                      color: Color.fromRGBO(179, 179, 179, 1), thickness: 1)),
              ListTile(
                title: Container(child: Center(child: Text('English'))),
                onTap: () => {},
              ),
            ],
          ),
        );
      },
    );
  }

  void SelectLangau() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text('Select Language'),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text(
                'Arabic',
                style: TextStyle(color: Color.fromRGBO(121, 158, 255, 1)),
              ),
              onPressed: () {
                Navigator.pop(context, 'Option 1');
              },
            ),
            CupertinoActionSheetAction(
              child: Text('French',
                  style: TextStyle(color: Color.fromRGBO(121, 158, 255, 1))),
              onPressed: () {
                Navigator.pop(context, 'Option 2');
              },
            ),
            CupertinoActionSheetAction(
              child: Text('English',
                  style: TextStyle(color: Color.fromRGBO(121, 158, 255, 1))),
              onPressed: () {
                Navigator.pop(context, 'Option 2');
              },
            ),
            /*CupertinoActionSheetAction(
              child: Text('Cancel'),
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(context, 'Cancel');
              },
            ),*/
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        //appBar: ,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        //button pour retourner au home page
                        onPressed: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        }),
                        icon: Icon(Icons.arrow_back_rounded), iconSize: 32,
                      ),
                      Padding(
                        //padding: EdgeInsets.only(left: 30, right: 30),
                        padding: EdgeInsets.symmetric(horizontal: 85),
                        child: Text(
                          'Settings',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  //padding: EdgeInsets.only(right: 150),
                  height: 70,
                  width: 290,
                  //color: Colors.black,

                  decoration: BoxDecoration(
                    color: Color.fromARGB(0, 255, 255, 255),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        width: 2, color: Color.fromRGBO(121, 158, 255, 1)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 32,
                        color: Color.fromRGBO(217, 217, 217, 1),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text('User Name')),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                        color: Color.fromRGBO(179, 179, 179, 1), thickness: 1)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 60),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.account_circle,
                              color: Color.fromRGBO(121, 158, 255, 1)),
                          Padding(
                            padding: EdgeInsets.only(left: 50.0, right: 8),
                            child: Text(
                              'Manage Account',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          IconButton(
                            onPressed: GoToSite,
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Color.fromRGBO(121, 158, 255, 1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.lock_rounded,
                              color: Color.fromRGBO(121, 158, 255, 1)),
                          Padding(
                              padding: EdgeInsets.only(left: 50.0, right: 10),
                              child: Text(
                                'Password',
                                style: TextStyle(fontSize: 16),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 57),
                            child: IconButton(
                              onPressed: GoToSite,
                              icon: Icon(Icons.arrow_forward_ios_rounded,
                                  color: Color.fromRGBO(121, 158, 255, 1)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.policy_rounded,
                              color: Color.fromRGBO(121, 158, 255, 1)),
                          Padding(
                            padding: EdgeInsets.only(left: 50.0, right: 10),
                            child: Text(
                              'Privacy',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 79),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.arrow_forward_ios_rounded,
                                    color: Color.fromRGBO(121, 158, 255, 1))),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.fingerprint_rounded,
                              color: Color.fromRGBO(121, 158, 255, 1)),
                          Padding(
                            padding: EdgeInsets.only(left: 50.0, right: 10),
                            child: Text(
                              'Biometric sensor',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          //Icon(Icons.toggle_off_rounded),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: GestureDetector(
                              onTap: Fingerprint,
                              child: ToggleButton(
                                color: Color.fromRGBO(121, 158, 255, 1),
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                        color: Color.fromRGBO(179, 179, 179, 1), thickness: 1)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 60),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.notifications_rounded,
                            color: Color.fromRGBO(121, 158, 255, 1)),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0, right: 10),
                          child: Text(
                            'Notifications',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 46),
                          child: GestureDetector(
                            onTap: Notifications,
                            child: ToggleButton(
                              color: Color.fromRGBO(121, 158, 255, 1),
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.wb_sunny_rounded,
                            color: Color.fromRGBO(121, 158, 255, 1)),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0, right: 10),
                          child: Text(
                            'Dark mode',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 62),
                          child: GestureDetector(
                            onTap: ToDark,
                            child: ToggleButton(
                              color: Color.fromRGBO(121, 158, 255, 1),
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    //showing languages to translate the app
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.translate_rounded,
                            color: Color.fromRGBO(121, 158, 255, 1)),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0, right: 10),
                          child: GestureDetector(
                            onTap: SelectLangau,
                            child: Text(
                              'Language',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 55),
                          child: IconButton(
                            //onPressed: SelectLang,
                            onPressed: SelectLangau,
                            icon: Icon(Icons.arrow_forward_ios_rounded,
                                color: Color.fromRGBO(121, 158, 255, 1)),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                        color: Color.fromRGBO(179, 179, 179, 1), thickness: 1)),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: GoToSite,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.headset_mic_rounded,
                            color: Color.fromRGBO(121, 158, 255, 1)),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0, right: 10),
                          child: Text(
                            'Help',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 98),
                          child: IconButton(
                              onPressed: GoToSite,
                              icon: Icon(Icons.arrow_forward_ios_rounded,
                                  color: Color.fromRGBO(121, 158, 255, 1))),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: SignOut,
                  child: Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(0, 255, 255, 255),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          width: 1, color: Color.fromRGBO(121, 158, 255, 1)),
                    ),
                    child: Center(
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                          color: Color.fromRGBO(121, 158, 255, 1),
                        ),
                        //GoogleFonts.poppins(color: Color.fromRGBO(121, 158, 255, 1),),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
