//import 'dart:async';
import 'dart:ui';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_localization/flutter_localization.dart';
//import 'package:waterdetection/Firebasedb_config/firebase_db.dart';
import 'components/icon_btn_state.dart';
//listen to the _isdark variable state

class ThemeNotifier extends ChangeNotifier {
  bool _isDark = false;

  bool get isDark => _isDark;

  set isDark(bool value) {
    _isDark = value;
    notifyListeners();
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  //initalization flutter_localizzation
  final FlutterLocalization _localization = FlutterLocalization.instance;
  //bool isdark initialazed on false
  bool isDark = false;
  //signout method
  void SignOut() {
    FirebaseAuth.instance.signOut();
  }

  //go to web site method
  void GoToSite() async {
    final Uri url = Uri.parse('googlechrome:https://www.google.com');
    await launchUrl(url);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  //control push notifications method
  void Notifications() {
    //if toggle btn on

    //if toggle btn off
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
          title: Text(
            'Select Language',
            style: TextStyle(fontFamily: "Poppins"),
          ),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: Text('French',
                  style: TextStyle(
                      color: Color.fromRGBO(121, 158, 255, 1),
                      fontFamily: "Poppins")),
              onPressed: () {
                Navigator.pop(context, 'translate to french');
                _localization.translate('fr');
              },
            ),
            CupertinoActionSheetAction(
              child: Text('English',
                  style: TextStyle(
                      color: Color.fromRGBO(121, 158, 255, 1),
                      fontFamily: "Poppins")),
              onPressed: () {
                Navigator.pop(context, 'translate to english');
                _localization.translate('en');
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

  bool isUsingGmail(User user) {
    List<UserInfo> providerData = user.providerData;
    for (UserInfo userInfo in providerData) {
      if (userInfo.providerId.contains('google.com')) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Theme(
      data: isDark ? ThemeData.light() : ThemeData.light(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          leading: null,
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          title: Text(
            '${AppLocale.words[0].getString(context)}',
            style: TextStyle(
                color: Color.fromRGBO(0, 78, 131, 10), fontFamily: "Poppins"),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    //padding: EdgeInsets.only(right: 150),
                    height: 70,
                    //width: 240,
                    width: MediaQuery.of(context).size.width * 0.7,

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
                      children: <Widget>[
                        if (user != null)
                          !isUsingGmail(user)
                              ? Icon(
                                  Icons.account_circle,
                                  size: 32,
                                  color: Color.fromRGBO(217, 217, 217, 1),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(
                                    user.photoURL!,
                                    fit: BoxFit.cover,
                                    height: 32,
                                    width: 32,
                                  ),
                                ),
                        Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Text(
                              "${user?.displayName}",
                            )),
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
                                    '${AppLocale.words[1].getString(context)}',
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
                                    '${AppLocale.words[2].getString(context)}',
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
                                      '${AppLocale.words[16].getString(context)}',
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
                                  //'${AppLocale.words[3].getString(context)}',
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
                                  '${AppLocale.words[4].getString(context)}',
                                  style: TextStyle(fontSize: 16),
                                ),
                                Switch(
                                  activeColor: Color.fromRGBO(121, 158, 255, 1),
                                  value: Provider.of<ThemeNotifier>(context)
                                      ._isDark,
                                  onChanged: (value) {
                                    Provider.of<ThemeNotifier>(context,
                                            listen: false)
                                        .isDark = value;
                                  },
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
                                    '${AppLocale.words[5].getString(context)}',
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
                                  '${AppLocale.words[6].getString(context)}',
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
                      //width: 120,
                      width: MediaQuery.of(context).size.width * 0.5,

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
                          '${AppLocale.words[7].getString(context)}',
                          style: TextStyle(
                            color: Color.fromRGBO(0, 78, 131, 10),
                          ),
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

mixin AppLocale {
  static const String title = '';
  static List<String> words = [
    'Settings',
    'Manage Account',
    'Password',
    'Notifications',
    'Dark mode',
    'Language',
    'Help',
    'Sign Out',
    'Home',
    'Bonjour.',
    'Actual Percentage',
    'Details',
    'Products',
    'Submit',
    'Serial Number',
    'History',
    'Privacy',
    'Sign Up',
    'Sign In'
  ];

  static Map<String, dynamic> EN = {
    title: 'Localization',
    words[0]: 'Settings',
    words[1]: 'Manage Account',
    words[2]: 'Password',
    words[3]: 'Notifications',
    words[4]: 'Dark mode',
    words[5]: 'Language',
    words[6]: 'Help',
    words[7]: 'Sign Out',
    words[8]: 'Home',
    words[9]: 'Hi.',
    words[10]: 'Actual Percentage',
    words[11]: 'Details',
    words[12]: 'Products',
    words[13]: 'Submit',
    words[14]: 'Serial Number',
    words[15]: 'History',
    words[16]: 'Privacy',
    words[17]: 'Sign Up',
    words[18]: 'Sign In',
  };
  static Map<String, dynamic> FR = {
    title: 'Localisation',
    words[0]: 'Paramètres',
    words[1]: 'Gérer le compte',
    words[2]: 'Mot de passe',
    words[3]: 'Notifications',
    words[4]: 'Mode sombre',
    words[5]: 'Langue',
    words[6]: 'Aide',
    words[7]: 'Se déconnecter',
    words[8]: 'Accueil',
    words[9]: 'Bonjour.',
    words[10]: 'Pourcentage réel',
    words[11]: 'Détails',
    words[12]: 'Produits',
    words[13]: 'Envoyer',
    words[14]: 'référence',
    words[15]: 'Historique',
    words[16]: 'Vie privée',
    words[17]: 'S\'inscrire',
    words[18]: 'Connexion',
  };
  static const Map<String, dynamic> AR = {title: 'الترجمه'};
}
