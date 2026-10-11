
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:waterdetection/auth_page.dart';

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
    FirebaseAuth.instance.signOut().then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AuthPage()),
      );
    }).catchError((error) {});
    // FirebaseAuth.instance.signOut();
  }

  //go to web site method
  void GoToContactUs() async {
    final Uri url = Uri.parse(
        'googlechrome:http://waterdetection.great-site.net/contact%20us.html');
    await launchUrl(url);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  void GoToProfile() async {
    final Uri url = Uri.parse(
        'googlechrome:http://waterdetection.great-site.net/profile.html');
    await launchUrl(url);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  //control push notifications method
  void Notifications() {}

  void SelectLanguage() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: [
              ListTile(
                title: Container(child: const Center(child: Text('Arabic'))),
                onTap: () => {},
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: const Divider(
                      color: Color.fromRGBO(179, 179, 179, 1), thickness: 1)),
              ListTile(
                title: Container(child: const Center(child: Text('French'))),
                onTap: () => {},
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: const Divider(
                      color: Color.fromRGBO(179, 179, 179, 1), thickness: 1)),
              ListTile(
                title: Container(child: const Center(child: Text('English'))),
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
          title: const Text(
            'Select Language',
            style: TextStyle(fontFamily: "Poppins"),
          ),
          actions: <Widget>[
            CupertinoActionSheetAction(
              child: const Text('French',
                  style: TextStyle(
                      color: Color.fromRGBO(121, 158, 255, 1),
                      fontFamily: "Poppins")),
              onPressed: () {
                Navigator.pop(context, 'translate to french');
                _localization.translate('fr');
              },
            ),
            CupertinoActionSheetAction(
              child: const Text('English',
                  style: TextStyle(
                      color: Color.fromRGBO(121, 158, 255, 1),
                      fontFamily: "Poppins")),
              onPressed: () {
                Navigator.pop(context, 'translate to english');
                _localization.translate('en');
              },
            ),
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
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.primary,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 45,
            ),
            child: Text(
              AppLocale.words[0].getString(context),
              style: const TextStyle(
                  color: Color(0xFF00BCD4), fontFamily: "Poppins"),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(0, 255, 255, 255),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        width: 2,
                        color: const Color(0xFFEEEEEE),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        if (user != null)
                          !isUsingGmail(user)
                              ? const Icon(
                                  Icons.person_outline,
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
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "${user?.displayName}",
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: const Divider(
                          color: Color.fromRGBO(179, 179, 179, 1),
                          thickness: 1)),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 60),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.person_outline,
                              color: Color(0xFF00BCD4),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocale.words[1].getString(context),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Color(0xFF00BCD4),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.lock_outline,
                              color: Color(0xFF00BCD4),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocale.words[2].getString(context),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Color(0xFF00BCD4),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.privacy_tip_outlined,
                              color: Color(0xFF00BCD4),
                            ),
                            GestureDetector(
                              onTap: GoToProfile,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.55,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocale.words[16].getString(context),
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Color(0xFF00BCD4),
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
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: const Divider(
                          color: Color.fromRGBO(179, 179, 179, 1),
                          thickness: 1)),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 60),
                    child: Column(children: [
                      const SizedBox(
                        height: 5,
                      ),

                      //showing languages to translate the app
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.language_outlined,
                            color: Color(0xFF00BCD4),
                          ),
                          GestureDetector(
                            onTap: SelectLang,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocale.words[5].getString(context),
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Color(0xFF00BCD4),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: const Divider(
                          color: Color.fromRGBO(179, 179, 179, 1),
                          thickness: 1)),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.headset_mic_outlined,
                          color: Color(0xFF00BCD4),
                        ),
                        GestureDetector(
                          onTap: GoToContactUs,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.55,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppLocale.words[6].getString(context),
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Color(0xFF00BCD4),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: SignOut,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(0, 255, 255, 255),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 1,
                          color: const Color(0xFFEEEEEE),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          AppLocale.words[7].getString(context),
                          style: const TextStyle(
                            color: Color(0xFF00BCD4),
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
    'Sign In',
    'pick a date',
    'Week measures: ',
    'don\'t have account',
    'already have account',
    'All mesures'
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
    words[19]: 'Pick a date',
    words[20]: 'Week measures: ',
    words[21]: 'don\'t have account',
    words[22]: 'already have account',
    words[23]: 'All mesures',
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
    words[19]: 'choisire une date',
    words[20]: 'Les mesures de semaine: ',
    words[21]: 'n\'avez pas de compte',
    words[22]: 'Vous avez déjà un compte',
    words[23]: 'Toutes les mesures',
  };
  static const Map<String, dynamic> AR = {title: 'الترجمه'};
}
