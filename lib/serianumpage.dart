import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import 'package:waterdetection/components/l_button.dart';
import 'package:waterdetection/components/text_field.dart';

import 'package:waterdetection/productmenupage.dart';
import 'package:waterdetection/settingspage.dart';
import 'services/qr_scan.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SerialPage extends StatefulWidget {
  SerialPage({super.key});

  @override
  State<SerialPage> createState() => _SerialPageState();
}

class _SerialPageState extends State<SerialPage> {
  final serialcontroller = TextEditingController();
  bool _isPressed = false;

  void Submit() {
    if (serialcontroller.text.isNotEmpty) {
      setState(() {
        _isPressed = !_isPressed;
      });
      DocumentReference? userRef =
          FirebaseAuth.instance.currentUser?.uid != null
              ? FirebaseFirestore.instance
                  .collection('compt')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
              : null;
      if (userRef != null) {
        FirebaseFirestore.instance.collection('detector').add({
          'ref': serialcontroller.text,
          'userRef': userRef,
          'userid': FirebaseAuth.instance.currentUser!.uid,
        });
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductMenuPage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Enter product ref or scan QR code',
              style: TextStyle(fontFamily: "Poppins"),
            ),
          );
        },
      );
    }
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

  Future<String?> getDocumentNameByEmail(String email) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('compt')
        .where('email', isEqualTo: email)
        .get();

    if (snapshot.docs.length > 0) {
      print(snapshot.docs[0].get('username'));
      return snapshot.docs[0].get('username');
    } else {
      return null;
    }
  }

  void OpenQRCodeScanner() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QRScan(),
      ),
    );
  }

  Future<void> saveSerialNumber(BuildContext context) async {
    String serialNumber = serialcontroller.text;
    // Perform your validation or condition checks here
    bool isSerialNumberEntered = serialNumber.isNotEmpty;
    if (isSerialNumberEntered) {
      // Save the flag in SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isSerialNumberEntered', true);
      // Navigate to the Product Menu page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductMenuPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Scaffold(
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      if (user != null)
                        !isUsingGmail(user)
                            ? Icon(
                                Icons.account_circle,
                                size: 128,
                                color: Color.fromRGBO(217, 217, 217, 1),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  user.photoURL!,
                                  fit: BoxFit.cover,
                                  height: 128,
                                  width: 128,
                                ),
                              ),
                      SizedBox(
                        height: 50,
                      ),
                      isUsingGmail(user!)
                          ? Text(
                              '${user.displayName}',
                              style: TextStyle(fontFamily: "Poppins"),
                            )
                          : Text(
                              '${FirebaseFirestore.instance.collection('compt').where('email', isEqualTo: FirebaseAuth.instance.currentUser?.email).get()}',
                              style: TextStyle(fontFamily: "Poppins"),
                            ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text_Field(
                                  controller: serialcontroller,
                                  hinText: 'Serial Number',
                                  obsecureText: false,
                                  preicon: null),
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(0, 255, 255, 255),
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  width: 2,
                                  color: Color.fromRGBO(0, 78, 131, 10),
                                ),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  Icons.qr_code_scanner_rounded,
                                  color: Color.fromRGBO(0, 78, 131, 10),
                                ),
                                onPressed: OpenQRCodeScanner,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      L_Button(
                        onTap: () => saveSerialNumber(context),
                        text: '${AppLocale.words[13].getString(context)}',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
