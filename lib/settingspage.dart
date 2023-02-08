import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:waterdetection/services/biometrics_aut.dart';
//import 'package:google_fonts/google_fonts.dart';

import 'package:waterdetection/homepage.dart';
import 'package:waterdetection/services/biometrics_aut.dart';

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
  // void ToDark() {
  //   //SwicthTheme
  //   setState(() {
  //     isDark = !isDark;
  //   });
  // }

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

  void SelectLanguage() {
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

  void SelectLang() {
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
                Navigator.pop(context, 'translate to arbic');
              },
            ),
            CupertinoActionSheetAction(
              child: Text('French',
                  style: TextStyle(color: Color.fromRGBO(121, 158, 255, 1))),
              onPressed: () {
                Navigator.pop(context, 'translate to french');
              },
            ),
            CupertinoActionSheetAction(
              child: Text('English',
                  style: TextStyle(color: Color.fromRGBO(121, 158, 255, 1))),
              onPressed: () {
                Navigator.pop(context, 'translate to english');
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
    return Theme(
      data: isDark ? ThemeData.light() : ThemeData.dark(),
      child: Scaffold(
        //appBar: ,

        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            icon:
                GestureDetector(onTap: ToHome, child: Icon(Icons.home_rounded)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: ToSettings, child: Icon(Icons.settings_rounded)),
            label: 'Setings',
            activeIcon: Icon(Icons.settings_rounded),
          ),
        ]),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
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
                    height: 10,
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
                        width: 2,
                        color: Color.fromRGBO(0, 78, 131, 10),
                      ),
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
                    height: 15,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Divider(
                          color: Color.fromRGBO(179, 179, 179, 1),
                          thickness: 1)),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 60),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.account_circle,
                              color: Color.fromRGBO(0, 78, 131, 10),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Manage Account',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Color.fromRGBO(0, 78, 131, 10),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.lock_rounded,
                              color: Color.fromRGBO(0, 78, 131, 10),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Password',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Color.fromRGBO(0, 78, 131, 10),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.policy_rounded,
                              color: Color.fromRGBO(0, 78, 131, 10),
                            ),
                            GestureDetector(
                              onTap: GoToSite,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.55,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Privacy',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Color.fromRGBO(0, 78, 131, 10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.fingerprint_rounded,
                              color: Color.fromRGBO(0, 78, 131, 10),
                            ),
                            GestureDetector(
                              onTap: (() async {
                                final isAuth =
                                    await FingerprintAuth().authenticate();
                                if (isAuth) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: ((context) => HomePage())));
                                }
                                ;
                              }),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.55,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Biometric sensor',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    //Icon(Icons.toggle_off_rounded),
                                    SwitchBtn(
                                      activecolor:
                                          Color.fromRGBO(121, 158, 255, 1),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Divider(
                          color: Color.fromRGBO(179, 179, 179, 1),
                          thickness: 1)),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 60),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.notifications_rounded,
                            color: Color.fromRGBO(0, 78, 131, 10),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.55,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Notifications',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SwitchBtn(
                                  activecolor: Color.fromRGBO(121, 158, 255, 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.wb_sunny_rounded,
                              color: Color.fromRGBO(0, 78, 131, 10)),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.55,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Dark mode',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SwitchBtn(
                                  activecolor: Color.fromRGBO(121, 158, 255, 1),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //showing languages to translate the app
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.translate_rounded,
                            color: Color.fromRGBO(0, 78, 131, 10),
                          ),
                          GestureDetector(
                            onTap: SelectLang,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Language',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Color.fromRGBO(0, 78, 131, 10),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Divider(
                          color: Color.fromRGBO(179, 179, 179, 1),
                          thickness: 1)),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.headset_mic_rounded,
                          color: Color.fromRGBO(0, 78, 131, 10),
                        ),
                        GestureDetector(
                          onTap: GoToSite,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.55,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Help',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Color.fromRGBO(0, 78, 131, 10),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
                          width: 1,
                          color: Color.fromRGBO(0, 78, 131, 10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                            color: Color.fromRGBO(0, 78, 131, 10),
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
      ),
    );
  }
}
